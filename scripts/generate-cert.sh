#! /bin/bash

cert_dir="cert"

mkdir $cert_dir
openssl req -newkey rsa:4096  -x509  -sha512  -days 365 -nodes -out $cert_dir/dev.cert -keyout $cert_dir/dev.key
