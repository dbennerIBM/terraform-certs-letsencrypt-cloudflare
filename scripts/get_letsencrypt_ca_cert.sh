#!/bin/bash

if [ "$OSTYPE" == "linux-gnu" ]; then
    crt=`curl https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt | base64 -w 0`
elif [ "$OSTYPE" == "darwin"* ]; then
    crt=`curl https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt | base64`
fi

echo {\"cert64\": \"${crt}\"}