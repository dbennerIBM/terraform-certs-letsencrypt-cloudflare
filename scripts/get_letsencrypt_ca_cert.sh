#!/bin/bash

crt=`curl https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt | base64 -w 0`

echo {\"cert64\": \"${crt}\"}
