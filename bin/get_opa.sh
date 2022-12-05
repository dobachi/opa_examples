#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0);pwd)
VERSION=v0.46.1
wget https://github.com/open-policy-agent/opa/releases/download/${VERSION}/opa_linux_amd64 -O ${CURRENT}/opa
chmod a+x ${CURRENT}/opa

