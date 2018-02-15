FROM alpine:3.7

RUN apk update && \
  apk -Uuv add docker htop nload groff less python py-pip \
  && pip install awscli \
  && apk --purge -v del py-pip \
  && rm /var/cache/apk/*

RUN mkdir -p /etc/workspace

WORKDIR /etc/workspace