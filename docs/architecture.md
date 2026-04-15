# 🏗️ Arquitetura do Sistema

## 📌 Overview

Este projeto implementa uma arquitetura de microsserviços baseada em eventos (event-driven), utilizando mensageria assíncrona para garantir desacoplamento, escalabilidade e resiliência.

O sistema simula um fluxo de e-commerce simplificado, onde a criação de um pedido dispara uma cadeia de eventos processados por múltiplos serviços independentes.

---

## 🧠 Princípios Arquiteturais

- Event-Driven Architecture
- Loose Coupling (baixo acoplamento)
- Single Responsibility por serviço
- Comunicação assíncrona via mensageria
- Resiliência com Retry + Dead Letter Queue (DLQ)

---

## 🧩 Serviços

| Serviço              | Responsabilidade                           |
| -------------------- | ------------------------------------------ |
| order-service        | Criação de pedidos e publicação de eventos |
| payment-service      | Processamento de pagamento                 |
| inventory-service    | Validação e reserva de estoque             |
| notification-service | Bridge entre eventos e WebSocket           |
| analytics-service    | Registro de eventos para análise           |

---

## 🔄 Fluxo Principal

1. Usuário cria um pedido (via frontend)
2. `order-service` persiste o pedido
3. Evento `order.created` é publicado
4. Serviços consumidores reagem:

- `payment-service` → processa pagamento
- `inventory-service` → valida estoque
- `analytics-service` → registra evento

5. Novos eventos são emitidos:

- `payment.processed`
- `stock.reserved` ou `stock.failed`

6. `notification-service`:

- Consome eventos
- Emite via WebSocket para o frontend

---

## 📡 Comunicação

### Assíncrona (principal)

- Broker de mensagens (Kafka)
- Padrão publish/subscribe

### Síncrona

- HTTP REST (frontend → order-service)

### Tempo real

- WebSocket (notification-service → frontend)

---

## 🌐 Frontend

Aplicação desenvolvida em Next.js com:

- Formulário para criação de pedidos
- Tela de notificações em tempo real
- Tela de gestão de estoque

---

## ☸️ Infraestrutura

### Local

- Docker Compose
- Kafka + Zookeeper
- PostgreSQL
- MongoDB

### Kubernetes

- Deployments por serviço
- Services (ClusterIP)
- Ingress Controller
- ConfigMaps e Secrets

---

## 🔔 Real-time (WebSocket)

O `notification-service` atua como um **event bridge**, convertendo eventos Kafka em mensagens WebSocket.

Fluxo:

Kafka → Consumer → Handler → Gateway → Frontend

---

## 🧪 Estratégia de Testes

- Testes unitários (services)
- Testes de integração com containers (Kafka, DB)
- Validação de fluxo de eventos

---

## ⚠️ Tratamento de Falhas

- Retry automático nos consumers
- Dead Letter Queue (DLQ)
- Logs estruturados

---

## 📈 Escalabilidade

- Serviços independentes podem escalar horizontalmente
- Kafka permite processamento distribuído
- WebSocket pode ser escalado com adapter (ex: Redis)

---

## 🔮 Possíveis Evoluções

- Autenticação e autorização (JWT)
- Observabilidade (tracing e métricas)
- Schema Registry para versionamento de eventos
- Orquestração com Saga Pattern
