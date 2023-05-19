#!/bin/sh

#gets trivy version
trivy --version

#generates an sbom for the current repo suing trivy
trivy repo --format cyclonedx --scanners vuln --output trivy.json $INPUT_REPO_URL

#uploads the sbom for the given repo to dtrack
curl -X POST https://testdtrack.vrkaushik.com/api/api/v1/bom -H "accept: application/json" -H "X-API-Key: ${INPUT_DTRACK_API_KEY}" -H "Content-Type: multipart/form-data" -F "autoCreate=true" -F "projectName=${INPUT_REPO_NAME}" -F "bom=@trivy.json" 

echo "bom uploaded"

#cleanup 
rm trivy.json
