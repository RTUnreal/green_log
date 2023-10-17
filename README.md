# Green Log

A project for the logging of power usage and calculation of equivalent co2
emissions with data provided by [co2signal](https://www.co2signal.com/).

This project was part of the "Programmierpraktikum: Skalierbare Systeme" summer
semester 2023 course. It was released as a single final commit as wished by
some participants.

## participants
- Alexander Gaus ([github](https://github.com/RTUnreal))
  - Created the `backend/ingester` service for creating, managing,
    authenticating and ingesting power usage data into influxdb of clients
- Participant 2
  - Created the `backend/aggregator` service for fetching co2signal data and
    pushing into influxdb
  - Created Terraform files for creation of devenv and pushing into production
  - Created CI configuration and infrastructure
- Participant 3
  - Created Admin frontend (`frontend/admin`) which is integrated into the
    ingester service
- Pascal Reppert
  - Created Client simulator frontend (`frontend/client`)
- Participant 5
  - Created Grafana Analysis Template which is added to Grafana with Terraform

<!--
TODO:
- Project Name
- Project Description
-->

## Required Tools

- `cargo`/`rust` recommended way of installation: https://rustup.rs/
- [yarn](https://yarnpkg.com/)
- [Terraform](https://www.terraform.io/)

Development Tools:

- [Docker](https://www.docker.com/)

## Usage

<!--
TODO:
- How to build and deploy our project?
-->

## Contributing

Before creating new commits, please run the following command to update the git hooks:

```sh
yarn
```
