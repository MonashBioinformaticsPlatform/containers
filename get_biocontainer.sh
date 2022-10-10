#!/bin/bash
#
# ./get_latest_container.sh
# Given a bioconda package name as the first argument, downloads
# the most recent corresponding Singularity image from quay.io/biocontainers
#
# Usage:
#
#   ./get_biocontainer.sh <package_name>
#
# Requires: python, curl, singularity

PACKAGE=$1
URL="https://quay.io/api/v1/repository/biocontainers/${PACKAGE}/tag/?limit=1&page=1&onlyActiveTags=true"
TAG=$(curl -H 'Content-Type: application/json' "${URL}" | python -c "import sys, json; print(json.loads(sys.stdin.read())['tags'][0]['name'])")

singularity pull "docker://quay.io/biocontainers/${PACKAGE}:${TAG}"