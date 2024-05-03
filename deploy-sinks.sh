#!/usr/bin/env bash

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "jdbc-sink-1",
  "config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "postgres.public.orders",
    "dialect.name": "PostgreSqlDatabaseDialect",
    "table.name.format": "orders",
    "batch.size": "1000",
    "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
    "auto.create": "true",
    "auto.evolve":"true",
    "delete.enabled": "true",
    "insert.mode": "upsert",
    "pk.mode": "record_key",
    "pk.fields": "id",
    "transforms": "ExtractField,dropPrefix,unwrap,convertTimestamp",
    "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "false",
    "transforms.ExtractField.field": "after",
    "transforms.dropPrefix.regex": "postgres.orders.(.*)",
    "transforms.dropPrefix.replacement": "$1",
    "transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
    "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
    "transforms.convertTimestamp.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.convertTimestamp.field": "created_at",
    "transforms.convertTimestamp.target.type": "Timestamp",
    "transforms.convertTimestamp.unix.precision": "microseconds",
    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter.schema.registry.url": "http://schema-registry:8081",
    "key.converter.enhanced.avro.schema.support": "true",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter.schema.registry.url": "http://schema-registry:8081",
    "value.converter.enhanced.avro.schema.support": "true"
   }
}'

sleep 1;

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "jdbc-sink-2",
  "config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "postgres.public.products",
    "dialect.name": "PostgreSqlDatabaseDialect",
    "table.name.format": "products",
    "batch.size": "1000",
    "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
    "auto.create": "true",
    "auto.evolve":"true",
    "delete.enabled": "true",
    "insert.mode": "upsert",
    "pk.mode": "record_key",
    "pk.fields": "id",
    "transforms": "ExtractField,dropPrefix,unwrap,convertTimestamp",
    "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "false",
    "transforms.ExtractField.field": "after",
    "transforms.dropPrefix.regex": "postgres.products.(.*)",
    "transforms.dropPrefix.replacement": "$1",
    "transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
    "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
    "transforms.convertTimestamp.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.convertTimestamp.target.type": "Timestamp",
    "transforms.convertTimestamp.field": "created_at",
    "transforms.convertTimestamp.unix.precision": "microseconds",
    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter.schema.registry.url": "http://schema-registry:8081",
    "key.converter.enhanced.avro.schema.support": "true",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter.schema.registry.url": "http://schema-registry:8081",
    "value.converter.enhanced.avro.schema.support": "true"
   }
}'

sleep 1;
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "jdbc-sink-3",
  "config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "postgres.public.users",
    "dialect.name": "PostgreSqlDatabaseDialect",
    "table.name.format": "users",
    "batch.size": "1000",
    "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
    "auto.create": "true",
    "auto.evolve":"true",
    "delete.enabled": "true",
    "insert.mode": "upsert",
    "pk.mode": "record_key",
    "pk.fields": "id",
    "transforms": "ExtractField,dropPrefix,unwrap,convertTimestamp",
    "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "false",
    "transforms.ExtractField.field": "after",
    "transforms.dropPrefix.regex": "postgres.users.(.*)",
    "transforms.dropPrefix.replacement": "$1",
    "transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
    "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
    "transforms.convertTimestamp.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.convertTimestamp.target.type": "Timestamp",
    "transforms.convertTimestamp.field": "created_at",
    "transforms.convertTimestamp.unix.precision": "microseconds",
    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter.schema.registry.url": "http://schema-registry:8081",
    "key.converter.enhanced.avro.schema.support": "true",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter.schema.registry.url": "http://schema-registry:8081",
    "value.converter.enhanced.avro.schema.support": "true"
   }
}'

sleep 1;

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
    "name": "jdbc-sink-4",
    "config": {
        "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
        "tasks.max": "1",
        "topics": "postgres.public.reviews",
        "dialect.name": "PostgreSqlDatabaseDialect",
        "table.name.format": "reviews",
        "batch.size": "1000",
        "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
        "auto.create": "true",
        "auto.evolve":"true",
        "delete.enabled": "true",
        "insert.mode": "upsert",
        "pk.mode": "record_key",
        "pk.fields": "id",
        "transforms": "ExtractField,dropPrefix,unwrap,convertTimestamp",
        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
        "transforms.unwrap.drop.tombstones": "false",
        "transforms.ExtractField.field": "after",
        "transforms.dropPrefix.regex": "postgres.reviews.(.*)",
        "transforms.dropPrefix.replacement": "$1",
        "transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
        "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
        "transforms.convertTimestamp.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
        "transforms.convertTimestamp.target.type": "Timestamp",
        "transforms.convertTimestamp.field": "created_at",
        "transforms.convertTimestamp.unix.precision": "microseconds",
        "key.converter": "io.confluent.connect.avro.AvroConverter",
        "key.converter.schema.registry.url": "http://schema-registry:8081",
        "key.converter.enhanced.avro.schema.support": "true",
        "value.converter": "io.confluent.connect.avro.AvroConverter",
        "value.converter.schema.registry.url": "http://schema-registry:8081",
        "value.converter.enhanced.avro.schema.support": "true"
    }
}'
