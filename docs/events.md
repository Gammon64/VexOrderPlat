# 📡 Catálogo de Eventos

Este documento descreve os eventos utilizados na comunicação entre os microsserviços.

---

## 📌 Convenções

- Eventos Kafka usam formato: `domain.action`
- Eventos WebSocket usam formato: `snake_case`
- Payloads são JSON

---

## 🧾 Order Events

### 📤 `order.created`

Emitido por: `order-service`  
Consumido por: `payment-service`, `inventory-service`, `analytics-service`

```json
{
  "orderId": "string",
  "customerId": "string",
  "total": number,
  "createdAt": "ISO8601 timestamp"
}
```

---

## 💳 Payment Events

### 📤 `payment.processed`

Emitido por: `payment-service`
Consumido por: `notification-service`, `analytics-service`

```json
{
  "orderId": "string",
  "status": "APPROVED | FAILED",
  "processedAt": "ISO8601 timestamp"
}
```

---

## 📦 Inventory Events

### 📤 `stock.reserved`

Emitido por: `inventory-service`
Consumido por: `notification-service`, `analytics-service`

```json
{
  "orderId": "string"
  "status": "RESERVED",
  "processedAt": "ISO8601 timestamp"
}
```

---

### 📤 `stock.failed`

Emitido por: `inventory-service`
Consumido por: `notification-service`, `analytics-service`

```json
{
  "orderId": "string",
  "reason": "string",
  "processedAt": "ISO8601 timestamp"
}
```

---

## 🔔 WebSocket Events

Emitidos por: `notification-service`
Consumidos por: frontend

---

### 🔌 `payment_processed`

```json
{
  "orderId": "string",
  "status": "SUCCESS | FAILED",
  "processedAt": "ISO8601 timestamp"
}
```

---

### 🔌 `stock_reserved`

```json
{
  "orderId": "string",
  "status": "RESERVED",
  "processedAt": "ISO8601 timestamp"
}
```

---

### 🔌 `stock_failed`

```json
{
  "orderId": "string",
  "reason": "string",
  "processedAt": "ISO8601 timestamp"
}
```

---

## ⚠️ DLQ (Dead Letter Queue)

Eventos que falham no processamento são enviados para tópicos de DLQ:

- `payment.dlq`
- `inventory.dlq`
- `analytics.dlq`

---

## 🔄 Idempotência

Consumidores devem garantir:

- Processamento idempotente
- Tolerância a duplicação de eventos

---

## 🔮 Evoluções Futuras

- Versionamento de eventos (`v1`, `v2`)
- Schema Registry
- Contratos com validação (Avro/JSON Schema)
