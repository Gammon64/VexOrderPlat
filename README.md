# 🚀 Event-Driven Microservices Platform

## 📌 Overview

Este projeto demonstra a construção de uma arquitetura de microsserviços baseada em eventos (_event-driven architecture_), utilizando mensageria assíncrona com Apache Kafka.

O sistema simula um fluxo de e-commerce, onde a criação de um pedido dispara uma cadeia de eventos processados por múltiplos serviços independentes.

---

## 🧠 Arquitetura

- Microsserviços independentes
- Comunicação assíncrona via eventos
- Baixo acoplamento entre serviços
- Processamento resiliente com DLQ
- Notificações em tempo real via WebSocket

---

## 🧩 Serviços

| Serviço              | Tecnologia         | Responsabilidade           |
| -------------------- | ------------------ | -------------------------- |
| order-service        | Java (Spring Boot) | Criação de pedidos         |
| payment-service      | Java (Spring Boot) | Processamento de pagamento |
| inventory-service    | Java (Spring Boot) | Validação de estoque       |
| analytics-service    | Java (Spring Boot) | Registro de eventos        |
| notification-service | Node (NestJS)      | Bridge Kafka → WebSocket   |
| frontend             | Next.js            | Interface do usuário       |

---

## 🔄 Fluxo Principal

1. Usuário cria um pedido
2. O `order-service` persiste e publica evento no Kafka
3. Serviços consumidores reagem:
   - `payment-service` → processa pagamento
   - `inventory-service` → valida estoque
   - `analytics-service` → registra evento

4. Novos eventos são publicados:
   - `payment.processed`
   - `stock.reserved` ou `stock.failed`

5. `notification-service` consome eventos e envia notificações em tempo real via WebSocket

---

## 🌐 Frontend

A aplicação frontend permite:

- Criar pedidos
- Visualizar notificações em tempo real
- Gerenciar estoque

---

## ⚙️ Tecnologias

- Java 21 + Spring Boot
- Node.js + NestJS
- React + Next.js
- Apache Kafka
- PostgreSQL
- MongoDB
- Docker
- Kubernetes

---

## 🐳 Rodando localmente (Docker)

```bash
cd infra/docker
docker-compose up --build
```

---

## ☸️ Rodando no Kubernetes

(Em construção)

```bash
kubectl apply -k infra/k8s/overlays/local
```

---

## 🧪 Testes

(Em construção)

- Testes unitários
- Testes de integração com containers

---

## 🔔 Notificações em tempo real

O `notification-service` atua como um **event bridge**, convertendo eventos Kafka em mensagens WebSocket consumidas pelo frontend.

---

## 📚 Documentação

- 📘 [Arquitetura](./docs/architecture.md)
- 📡 [Eventos](./docs/events.md)

---

## 📈 Diferenciais do projeto

- Arquitetura orientada a eventos
- Comunicação assíncrona com Kafka
- Processamento resiliente com DLQ
- Integração em tempo real com WebSocket
- Deploy em Kubernetes
- Integração entre múltiplas tecnologias (Java + Node + React)

---

## 🔮 Próximos passos

- Autenticação (JWT)
- Observabilidade (logs, métricas, tracing)
- Escalabilidade com múltiplas réplicas
- Versionamento de eventos

---

## 👨‍💻 Autor

Projeto desenvolvido para fins de estudo e portfólio.
