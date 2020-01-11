FROM alpine:3

RUN apk add --update --no-cache openssh openssh-sftp-server dropbear \
    && mkdir /etc/dropbear \
    && mkdir /mnt \
    && touch /var/log/lastlog


COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["dropbear", "-RFEmwg", "-p", "22"]
