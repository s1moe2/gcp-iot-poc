# GCP Cloud IoT PoC

This projects contains documentation and code regarding an IoT proof of concept that involves Google Cloud Platform's IoT Core, Raspberry Pi, Node.js, Terraform (and hopefully Arduinos).

## Certificates

Generate certificates for all devices: `./gen_certs.sh`. In this script there is an array of device names that can be edited so the script generates certificates for all. These certificates will be referenced in both the client(s) and in terraform files that declare GCP IoT Core devices.

## Infrastructure

- Create a project in GCP
- Create a service account, grant it the "Cloud IoT Admin" and "Pub/Sub Admin" roles; create a new JSON key for the service account and download it
- `cd infra`
- Create a `.tfvars` file and add the required variable values (see `infra/.tfvars.sample` for a sample)
- `terraform init`
- `terraform apply -var-file=.tfvars`

## Client

Node.js app that connects to the MQTT broker and listens for fake commands on the stdin prompt and sends them as messages to the broker.