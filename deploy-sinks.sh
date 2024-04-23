#!/usr/bin/env bash

#curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
#  "name": "jdbc-sink-1",
#  "config": {
#    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
#     "tasks.max": "1",
#      "topics": "ybconnector1.public.orders",
#      "dialect.name": "PostgreSqlDatabaseDialect",
#      "table.name.format": "orders",
#      "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
#      "auto.create": "true",
#      "auto.evolve":"true",
#      "insert.mode": "upsert",
#      "pk.fields": "id",
#      "pk.mode": "record_key",
#      "delete.enabled":"true",
#        "transforms": "unwrap,TimestampConverter",
#        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
#        "transforms.unwrap.drop.tombstones": "false",
#        "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
#        "transforms.TimestampConverter.field": "your_field_name_here",
#        "transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss.SSS",
#        "transforms.TimestampConverter.target.type": "string",
#      "key.converter":"io.confluent.connect.avro.AvroConverter",
#      "key.converter.schema.registry.url":"http://schema-registry:8081",
#      "key.converter.enhanced.avro.schema.support":"true",
#      "value.converter":"io.confluent.connect.avro.AvroConverter",
#      "value.converter.schema.registry.url":"http://schema-registry:8081",
#      "value.converter.enhanced.avro.schema.support":"true"
#   }
#}'

sleep 1;

#curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
#  "name": "jdbc-sink-2",
#  "config": {
#    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
#     "tasks.max": "1",
#      "topics": "ybconnector2.public.products",
#      "dialect.name": "PostgreSqlDatabaseDialect",
#      "table.name.format": "products",
#      "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
#      "auto.create": "true",
#      "auto.evolve":"true",
#      "insert.mode": "upsert",
#      "pk.fields": "id",
#      "pk.mode": "record_key",
#      "delete.enabled":"true",
#        "transforms": "unwrap,TimestampConverter",
#        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
#        "transforms.unwrap.drop.tombstones": "false",
#        "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
#        "transforms.TimestampConverter.field": "your_field_name_here",
#        "transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss.SSS",
#        "transforms.TimestampConverter.target.type": "string",
#      "key.converter":"io.confluent.connect.avro.AvroConverter",
#      "key.converter.schema.registry.url":"http://schema-registry:8081",
#    "key.converter.enhanced.avro.schema.support":"true",
#      "value.converter":"io.confluent.connect.avro.AvroConverter",
#      "value.converter.schema.registry.url":"http://schema-registry:8081",
#    "value.converter.enhanced.avro.schema.support":"true"
#   }
#}'

sleep 1;

#curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
#  "name": "jdbc-sink-3",
#  "config": {
#    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
#     "tasks.max": "1",
#      "topics": "ybconnector3.public.users",
#      "dialect.name": "PostgreSqlDatabaseDialect",
#      "table.name.format": "users",
#      "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
#      "auto.create": "true",
#      "auto.evolve":"true",
#      "insert.mode": "upsert",
#      "pk.fields": "id",
#      "pk.mode": "record_key",
#      "delete.enabled":"true",
#        "transforms": "unwrap,TimestampConverter",
#        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
#        "transforms.unwrap.drop.tombstones": "false",
#        "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
#        "transforms.TimestampConverter.field": "created_at",
#        "transforms.TimestampConverter.format": "YYYY-MM-DDTHH:MM:SS.mmmZ",
#        "transforms.TimestampConverter.target.type": "string",
#      "key.converter":"io.confluent.connect.avro.AvroConverter",
#      "key.converter.schema.registry.url":"http://schema-registry:8081",
#    "key.converter.enhanced.avro.schema.support":"true",
#      "value.converter":"io.confluent.connect.avro.AvroConverter",
#      "value.converter.schema.registry.url":"http://schema-registry:8081",
#    "value.converter.enhanced.avro.schema.support":"true"
#   }
#}'

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
    "name": "jdbc-sink-3",
    "config": {
            "name": "jdbc-sink-3",
            "connector.class": "com.yugabyte.jdbc.JdbcSinkConnector",
            "transforms.dropPrefix.replacement": "$1",
            "connection.user": "postgres",
            "connection.password": "postgres",
            "tasks.max": "1",
            "topics": "ybconnector3.public.users",
            "batch.size": "1000",
            "delete.enabled": "true",
            "connection.urls": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
            "auto.create": "false",
            "insert.mode": "upsert",
            "pk.mode": "record_key",
            "pk.fields": "id",
            "transforms": "ExtractField,dropPrefix,unwrap",
        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
        "transforms.unwrap.drop.tombstones": "false",
            "transforms.ExtractField.field": "after",
            "transforms.dropPrefix.regex": "postgres.users.(.*)",
            "transforms.dropPrefix.type": "org.apache.kafka.connect.transforms.RegexRouter",
            "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
              "key.converter":"io.confluent.connect.avro.AvroConverter",
              "key.converter.schema.registry.url":"http://schema-registry:8081",
            "key.converter.enhanced.avro.schema.support":"true",
              "value.converter":"io.confluent.connect.avro.AvroConverter",
              "value.converter.schema.registry.url":"http://schema-registry:8081",
            "value.converter.enhanced.avro.schema.support":"true"
    }
}'


sleep 1;
#
#curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
#    "name": "jdbc-sink-4",
#    "config": {
#        "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
#        "tasks.max": "1",
#        "topics": "ybconnector4.public.reviews",
#        "dialect.name": "PostgreSqlDatabaseDialect",
#        "table.name.format": "reviews",
#        "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
#        "auto.create": "true",
#        "auto.evolve": "true",
#        "insert.mode": "upsert",
#        "pk.fields": "id",
#        "pk.mode": "record_key",
#        "delete.enabled": "true",
#        "transforms": "unwrap,TimestampConverter",
#        "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
#        "transforms.unwrap.drop.tombstones": "false",
#        "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
#        "transforms.TimestampConverter.field": "your_field_name_here",
#        "transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss.SSS",
#        "transforms.TimestampConverter.target.type": "string",
#        "key.converter": "io.confluent.connect.avro.AvroConverter",
#        "key.converter.schema.registry.url": "http://schema-registry:8081",
#        "key.converter.enhanced.avro.schema.support": "true",
#        "value.converter": "io.confluent.connect.avro.AvroConverter",
#        "value.converter.schema.registry.url": "http://schema-registry:8081",
#        "value.converter.enhanced.avro.schema.support": "true"
#    }
#}'
