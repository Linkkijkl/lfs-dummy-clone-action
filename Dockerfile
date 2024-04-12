FROM alpine

RUN apk update && apk add bash git git-lfs

COPY entrypoint.sh /entrypoint.sh
COPY dummies /dummies

ENTRYPOINT ["/entrypoint.sh"]
