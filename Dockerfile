FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

#Install Trivy for scanning repos and generating sboms
RUN  curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.38.3

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
