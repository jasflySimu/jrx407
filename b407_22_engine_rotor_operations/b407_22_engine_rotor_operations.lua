-- Variables globales ajustadas para el PID
target_rpm_idle = 60  -- 60% de 420 RPM
target_rpm_fly = 420  -- RPM objetivo
target_engine_rpm = 100   -- 100% de RPM objetivo en FLY
Kp = 0.315--0.9--10000        -- Constante proporcional del PID 0.2 - 
Ki = 0.0000008        -- Constante integral del PID
Kd = 10--100000--0.0001       -- Constante derivativa del PID
-- Variables para el ajuste automático
errorAcumulado = 0
errorAnterior = 0
rpmObjetivo = 100  -- RPM objetivo del N2 (ajustar según el helicóptero)
rpmObjetivo_rotor = 420 -- RPM objetivo del rotor (ajustar según el helicóptero)

filtro_salida = 0.21  -- Valor inicial del filtro
alpha = 0.15          -- Factor de suavizado (0-1, menor = más suave)
tiempo_muestreo = 0.03  -- Tiempo entre actualizaciones (aprox. 30Hz)

-- Variables globales para el seguimiento de climb rate
climb_rate_anterior = 0
max_climb_rate_change = 5  -- metros por segundo cuadrado (ajustable)
climb_rate_filter = 0      -- Para suavizar la lectura del climb rate

-- Datarefs necesarios
--  Throttles
throttle_input = find_dataref("sim/flightmodel/engine/ENGN_thro[0]") -- joystick input
throttle_pid= find_dataref("sim/flightmodel/engine/ENGN_thro_use[0]") -- salida del pid -> utilizamos para hacer el cambio en el acelerador 

dr_mixture_ratio = find_dataref("sim/cockpit2/engine/actuators/mixture_ratio[0]")      --- Control de combustible
rotor_rpm_dataref =  find_dataref("sim/cockpit2/engine/indicators/prop_speed_rpm[0]")    --- 420 rpm rotor   quiere decir 100 % N2
engine_rpm_dataref = find_dataref("sim/flightmodel/engine/ENGN_N2_[0]")                  ----- 100 % N2    quiere decir 420 rpm rotor 

torque_dataref = find_dataref("sim/flightmodel/engine/ENGN_TRQ[0]")
vert_speed_dataref = find_dataref("sim/flightmodel/position/local_vy")      
collective_dataref = find_dataref("sim/cockpit2/engine/actuators/prop_angle_degrees[0]")  -- Colectivo
fadec_switch = find_dataref("sim/cockpit2/engine/actuators/fadec_on[0]") -- Botón FADEC
dr_fadec                    = find_dataref("sim/cockpit2/engine/actuators/fadec_on[0]")
ground_height_dataref = find_dataref("sim/flightmodel/position/y_agl")

-- Nuevos datarefs para actitud
pitch_dataref = find_dataref("sim/flightmodel/position/theta")
roll_dataref = find_dataref("sim/flightmodel/position/phi")
pitch_rate_dataref = find_dataref("sim/flightmodel/position/P")
roll_rate_dataref = find_dataref("sim/flightmodel/position/Q")


-- Función para ajustar PID basado en climb rate
function ajustar_pid_por_climb_rate(climb_rate_actual)
    -- Suavizar la lectura del climb rate
    climb_rate_filter = (alpha * climb_rate_actual) + ((1 - alpha) * climb_rate_filter)
    
    -- Calcular la aceleración vertical (cambio en climb rate)
    aceleracion_vertical = math.abs(climb_rate_filter - climb_rate_anterior) / tiempo_muestreo
    
    -- Factores de ajuste basados en la aceleración vertical
    factor_ajuste = math.min(aceleracion_vertical / max_climb_rate_change, 1)
    
    -- Ajustar PID dinámicamente
    if factor_ajuste > 0.3 then  -- Solo ajustar si el cambio es significativo
        -- Aumentar Kp temporalmente para respuesta más agresiva
        Kp_temp = Kp * (1 + factor_ajuste * 0.8)
        -- Aumentar Kd para mejor amortiguación
        Kd_temp = Kd * (1 + factor_ajuste)
        -- Reducir Ki para evitar sobre-acumulación
        Ki_temp = Ki * (1 - factor_ajuste * 0.5)
        
        return Kp_temp, Ki_temp, Kd_temp
    end
    
    -- Si no hay cambios significativos, retornar valores normales
    return Kp, Ki, Kd
end

-- Filtro pasa bajo para la parte derivativa D
function filtrar_derivativa(error_actual, derivativa_previa )
    derivativa_sin_filtrar = (error_actual - errorAnterior)/tiempo_muestreo
    derivativa_filtrada = alpha*derivativa_sin_filtrar + (1-alpha)*derivativa_previa
    errorAnterior = error_actual
    return derivativa_filtrada
end

-- Función principal del FADEC
function fadec_controller()

    -- Obtener RPM actual del rotor (ajustar DataRef según X-Plane)
    if throttle_input <= 0.351 then
        throttle_pid = throttle_input
    end    
    if throttle_input > 0.351 then
        if dr_fadec == 1 then
            rpmActual = engine_rpm_dataref
            rpmActual_rotor = rotor_rpm_dataref
                        
            -- Calcular error1
            error2 = rpmObjetivo_rotor - rpmActual_rotor
            error3 = (error2 - rpmActual/42) 
            
            error4 = (100- rpmActual) 
            error5 = error4 - rpmActual_rotor/42
            
            error1 = (error3 +error5)/2
            --error1 = 420 * (1 + 0.5 * error3) + 420 * (1 + 0.5 * error2)
            -- Compensación del colectivo
            compensacion_colectivo = 0

            -- Obtener valores PID ajustados por climb rate
            Kp_actual, Ki_actual, Kd_actual = ajustar_pid_por_climb_rate(vert_speed_dataref)
                        
            -- Ajustar Kp dinámicamente basado en la posición del colectivo
            Kp_dinamico = Kp_actual --* (1 + compensacion_colectivo * 0.8)
            Kd_dinamico = Kd --* (1 - compensacion_colectivo * 10)
            -- Calcular componentes PID con Kp dinámico
            P = error1 * Kp_dinamico
            errorAcumulado = errorAcumulado + error1
            I = errorAcumulado * Ki_actual

            D = (error1 - errorAnterior) * Kd_actual

            P2 = error2 * Kp_dinamico
            errorAcumulado2 = errorAcumulado + error2
            I2 = errorAcumulado2 * Ki_actual

            D2 = (error2 - errorAnterior) * Kd_actual
            
            -- filtramos D
            --D_filtrada = filtrar_derivativa(error1, D)
            
            -- Calcular salida del controlador
            salida = P + I + D--_filtrada
            --salida2 = P2 + I2 + D2--_filtrada

            --salidaT = (salida + salida2)
            -- Limitar salida entre 0 y 1 (throttle)
            --salida_pid = math.max(0.1, math.min(salida, 1))
            salida_pid = math.max(0.1, math.min(salida, 1))
            -- Aplicar filtro de suavizado
            filtro_salida = (alpha * salida_pid) + ((1 - alpha) * filtro_salida)

            throttle_pid = filtro_salida + filtro_salida*torque_dataref*0.0001 -- flitro de salida tiene como una de sus variables salida_pid
            
            -- Actualizar variables
            errorAnterior = error1
            
            -- Ajustar PID
            --ajustarPID(error1)
            
            -- Retornar diagnóstico
            return {
                rpm_actual = rpmActual_rotor,
                error1 = error1,
                salida = salida,
                kp = Kp,
                ki = Ki,
            
                kd = Kd
            }
        end
    end
end

-- FUEL CONTROL
function fuel_control()
    if throttle_input >= 0.130 then
        dr_mixture_ratio = 1
    end
    if throttle_input <= 0.01 then
        dr_mixture_ratio = 0
    end
end

-- Callbacks de X-Plane para ejecutar el controlador FADEC
function after_physics()
    fadec_controller()
    fuel_control()
end

function after_replay()
    fadec_controller()
    fuel_control()
end