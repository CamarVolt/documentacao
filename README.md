# Sistema de Monitoramento de Energia Elétrica (SMEE)

**Versão:** 2.0  
**Projeto:** CamrVolt  
**Disciplina:** Engenharia de Software / IoT  
**Docente:** Prof. Luís Camargo  
**Discentes:** Gustavo Henrique Martins, Ícaro Caldeira Botelho, Maruan Biasi El Achkar, Rafael Pereira, Ricardo Falcão Schlieper

## Especificação de Requisitos de Software

Este repositório contém a documentação completa do **Sistema de Monitoramento de Energia Elétrica (SMEE)**, um projeto IoT desenvolvido para monitorar, analisar e otimizar o consumo de energia elétrica em tempo real.

O objetivo do documento é descrever detalhadamente as funcionalidades, requisitos técnicos e artefatos necessários para o desenvolvimento do protótipo, possibilitando o acompanhamento e validação do sistema.

### Descrição Geral do Produto/Protótipo

O **SMEE** coleta dados de tensão, corrente e potência através do ESP32, transmitindo-os via Wi-Fi para um servidor central.  
Os dados são processados no **Node-RED**, armazenados em **InfluxDB**, e exibidos em **dashboards Grafana** com relatórios e alertas configuráveis.

### Contexto para Produto/Protótipo

**Ambiente de uso:** residências, empresas e indústrias.  
**Usuários:** moradores, administradores e engenheiros de manutenção.

**Fluxo de interação:**  
`Sensores → ESP32 → Wi-Fi → MQTT Broker → Node-RED → InfluxDB → Grafana/App → Usuário`

### Considerações

O desenvolvimento do **SMEE** demonstrou como soluções IoT podem contribuir para a **eficiência energética e segurança elétrica**.  
Os principais desafios envolveram:

- Calibração de sensores;
- Integração de módulos de software;
- Garantia da segurança elétrica e de dados.  

Futuras evoluções incluem **monitoramento via Bluetooth** e **maior integração com assistentes virtuais**.
