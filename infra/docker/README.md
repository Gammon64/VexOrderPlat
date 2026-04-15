# 🚀 Subindo o ambiente

```bash
cd infra/docker
docker-compose up -d
```

---

# 🔍 Validação

## Kafka UI

👉 [http://localhost:8080](http://localhost:8080)

Você deve ver:

- cluster
- tópicos

---

## PostgreSQL

```bash
psql -h localhost -U <ENV.POSTGRES_USER> -d <ENV.POSTGRES_DB>
```

---

## MongoDB

```bash
mongosh mongodb://localhost:27017
```

---

# 🧠 Explicação técnica

- Kafka configurado com listeners internos e externos
- Zookeeper para coordenação
- PostgreSQL para dados transacionais
- MongoDB para leitura analítica
- Kafka UI para inspeção de tópicos e mensagens

---

# 🔥 Possível upgrade futuro

- KRaft (sem Zookeeper)
- Schema Registry
- Multi-broker cluster
