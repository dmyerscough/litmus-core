#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${JFROG_API}" ]]; then
    echo "JFROG_API not found"
    exit 1
fi

HELM_PACKAGE_NAME=$( cat Chart.yaml | yq '(.name + "-" + .version + ".tgz")' )
helm package ./

curl -H "X-JFrog-Art-Api:${JFROG_API}" -T ${HELM_PACKAGE_NAME} "https://mirulabs.jfrog.io/artifactory/litmus-kubernetes-chaos/${HELM_PACKAGE_NAME}"
