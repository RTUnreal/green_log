# Ingester

The Ingester daemon serves as the endpoint for ingesting power usage data, as well as, the devices management point.

It is recomended to use the provided Terraform modules for running the Ingester

## Building

```shell
cargo build --release ingester
```

the binary should be in `target/release/ingester`

## Running

either:

```shell
cargo run --release ingester
```

or in docker:

```shell
docker build backend/ingester/Dockerfile
```

## Configuration

All configurations are done with environment variables:

`INFLUXDB_URL` - URL of the InfluxDB instance
`INFLUXDB_TOKEN` - Token for the InfluxDB instance
`DATABASE_URL` - URL of the postgres database in the format `postgres://{username}:{password}@{host}(:{port})/{db_name}`
`BIND_ADDR` - TCP address to bind to, ex. `0.0.0.0:3000`
`GRAFANA_BASE_URL` - Grafana base url
`SERVE_DIR` - directory for static files of the backend for the management of devices and client simulator

optional:
`INFLUXDB_QUERY` - Name for the InfluxDB Query to write to
`RUST_LOG` - set logging level
