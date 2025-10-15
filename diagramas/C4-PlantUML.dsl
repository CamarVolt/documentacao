workspace "SMEE - Sistema de Monitoramento de Energia Elétrica" "C4 completo para o protótipo IoT de monitoramento elétrico" {

    model {

        // --- Pessoas ---
        usuario = person "Usuário" "Consumidor ou administrador que monitora o consumo de energia e recebe alertas."
        engenheiro = person "Engenheiro de Manutenção" "Analisa dados avançados e ajusta parâmetros de medição."

        // --- Sistema Principal ---
        smee = softwareSystem "SMEE" "Sistema de Monitoramento de Energia Elétrica. Mede, armazena e exibe dados de consumo em tempo real." {
            
            // --- Contêineres ---
            esp32 = container "ESP32 Firmware" "Coleta dados dos sensores e envia via MQTT." "C/C++ (Arduino Core)"
            mqtt_broker = container "MQTT Broker (Mosquitto)" "Recebe dados via Wi-Fi e distribui mensagens para o servidor." "Eclipse Mosquitto"
            node_red = container "Servidor Node-RED" "Processa dados recebidos, gera alertas e envia para o banco de dados." "Node-RED (JavaScript)"
            influxdb = container "Banco de Dados InfluxDB" "Armazena leituras de tensão, corrente e potência em série temporal." "InfluxDB"
            grafana = container "Dashboard Grafana" "Exibe visualizações e relatórios em tempo real." "Grafana"
            api = container "API Web" "Permite acesso aos dados e exportação em CSV/JSON." "Node.js + Express"

            // --- Relacionamentos ---
            usuario -> grafana "Visualiza gráficos, relatórios e alertas"
            engenheiro -> grafana "Analisa dados e ajusta parâmetros"

            esp32 -> mqtt_broker "Publica medições a cada 10 segundos (tensão, corrente, potência, fator de potência)"
            mqtt_broker -> node_red "Envia mensagens MQTT"
            node_red -> influxdb "Grava dados processados"
            grafana -> influxdb "Consulta dados históricos"
            node_red -> grafana "Configura alertas e thresholds"
            api -> influxdb "Consulta/exporta dados"
            usuario -> api "Solicita exportações CSV/JSON"
        }

        // --- Sistema Externo (opcional) ---
        rede_wifi = softwareSystem "Rede Wi-Fi" "Canal de comunicação entre dispositivos e servidor central."
        esp32 -> rede_wifi "Transmite dados via Wi-Fi"
        rede_wifi -> mqtt_broker "Encaminha pacotes MQTT"

    }

    views {

        // --- Diagrama de Contexto ---

        // --- Estilo visual ---
        styles {
            element "Person" {
                shape person
                background #0EA5E9
                color #ffffff
            }
            element "Software System" {
                background #1E293B
                color #ffffff
            }
            element "Container" {
                background #334155
                color #E2E8F0
            }
            element "Component" {
                background #475569
                color #F1F5F9
            }
            element "Database" {
                shape cylinder
                background #64748B
                color #ffffff
            }
        }

        theme default
    }
}
