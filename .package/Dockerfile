FROM alpine:3.16

# Set Helm version
ENV DESIRED_VERSION=v3.9.4

RUN apk add --update bash ca-certificates openssl curl git yq \
    && (curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash) \
    && helm version

COPY package.sh /usr/sbin/
