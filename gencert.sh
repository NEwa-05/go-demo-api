#! /bin/bash

openssl req \
-x509 \
-newkey rsa:4096 \
-days 3650 \
-nodes \
-keyout server.key \
-out server.crt \
-subj '/CN='$1'' \
-config <( \
  echo '[req]'; \
  echo 'distinguished_name=req')