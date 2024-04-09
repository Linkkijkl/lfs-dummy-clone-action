FROM alpine

COPY entrypoint.sh /entrypoint.sh
COPY dummies /dummies

ENTRYPOINT ["/entrypoint.sh"]
