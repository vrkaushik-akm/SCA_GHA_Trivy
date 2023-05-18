FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

ENV DTRACK_API_KEY =  ${{ secrets.DTRACK_API_KEY }} 

RUN apk add --update curl

#Install Trivy for scanning repos and generating sboms
RUN  curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.38.3

RUN trivy --version

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
