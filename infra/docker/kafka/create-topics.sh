#!/bin/bash

echo "Aguardando Kafka subir..."
sleep 10

kafka-topics --create --if-not-exists \
  --bootstrap-server kafka:29092 \
  --replication-factor 1 \
  --partitions 3 \
  --topic order.created

kafka-topics --create --if-not-exists \
  --bootstrap-server kafka:29092 \
  --replication-factor 1 \
  --partitions 3 \
  --topic payment.processed

kafka-topics --create --if-not-exists \
  --bootstrap-server kafka:29092 \
  --replication-factor 1 \
  --partitions 3 \
  --topic inventory.updated

echo "Tópicos criados com sucesso!"