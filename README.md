# GCP Cloud IoT PoC

This projects contains documentation and code regarding an IoT proof of concept that involves Google Cloud Platform's IoT Core, Raspberry Pi, Node.js, Terraform (and hopefully Arduinos).

## Certificates

Generate certificates for device authentication on GCP's broker: `./gen_certs.sh`

## Infrastructure

- Create a project in GCP
- Create a service account, grant it the "Cloud IoT Admin" and "Pub/Sub Admin" roles; create a new JSON key for the service account and download it
- `cd infra`
- Create a `.tfvars` file and add the required variable values (see `infra/.tfvars.sample` for a sample)
- `terraform init`
- `terraform apply -var-file=.tfvars`


## Client

Node.js app that connects to the MQTT broker and listens for fake commands on the stdin prompt and sends them as messages to the broker.