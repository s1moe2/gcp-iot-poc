#!/bin/bash

devices=("raspberrypi3")

mkdir -p infra/device_certs && cd infra/device_certs

for i in ${!devices[@]};
do
    device=${devices[$i]}
    openssl genpkey -algorithm RSA -out "${device}_rsa_private.pem" -pkeyopt rsa_keygen_bits:2048
    openssl rsa -in "${device}_rsa_private.pem" -pubout -out "${device}_rsa_public.pem"
done