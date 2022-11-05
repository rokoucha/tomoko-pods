FROM docker.io/library/alpine:3.16

RUN apk update && apk add --no-cache apcupsd openssh

CMD [ "/sbin/apcupsd", "-b" ]
