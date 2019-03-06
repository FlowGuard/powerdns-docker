FROM alpine:latest

RUN sed -i -e 's#alpine/v[0-9.]*/#alpine/edge/#g' /etc/apk/repositories \
    && apk --update --no-cache add \
        py2-pip \
        pdns-recursor \
	bash \
    && pip install envtpl \
    && rm -f /etc/pdns/recursor.conf

COPY recursor.conf.tpl /etc/pdns/recursor.conf.tpl
COPY start.sh /
VOLUME /etc/pdns

ENTRYPOINT [ "/start.sh" ]
CMD [ "/usr/sbin/pdns_recursor", "--disable-syslog=yes", "--daemon=no" ]
