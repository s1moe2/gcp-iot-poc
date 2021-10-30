#!/bin/bash

mkdir certs && cd certs
openssl req -x509 -newkey rsa:2048 -keyout rasp_private.pem -nodes -out rasp_cert.pem -subj "/CN=unused"