FROM docker.io/library/alpine:3.19

RUN apk update && apk add --no-cache apcupsd openssh

CMD [ "/sbin/apcupsd", "-b" ]
