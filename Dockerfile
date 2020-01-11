FROM alpine:3

RUN apk add --update --no-cache openssh openssh-sftp-server dropbear \
    && mkdir /etc/dropbear \
    && touch /var/log/lastlog \
    && echo 'ForceCommand sftp' >> /etc/ssh/sshd_config \
    && echo 'ChrootDirectory /mnt' >> /etc/ssh/sshd_config
    
COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["dropbear", "-RFEwg", "-p", "22"]
