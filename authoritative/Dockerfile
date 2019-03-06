FROM alpine:latest

RUN sed -i -e 's#alpine/v[0-9.]*/#alpine/edge/#g' /etc/apk/repositories \
    && apk --update --no-cache add \
        py2-pip \
        pdns \
        pdns-backend-odbc \
        pdns-backend-random \
        pdns-backend-bind \
        pdns-backend-remote \
        pdns-backend-lua \
        pdns-backend-pgsql \
        pdns-backend-ldap \
        pdns-backend-mysql \
        pdns-backend-sqlite3 \
        pdns-backend-pipe \
        pdns-backend-geoip \
        pdns-backend-mariadb \
        pdns-backend-mydns \
        bash \
    && pip install envtpl \
    && rm -f /etc/pdns/pdns.conf

COPY pdns.conf.tpl /etc/pdns/pdns.conf.tpl
COPY start.sh /
VOLUME /etc/pdns

ENTRYPOINT [ "/start.sh" ]
CMD [ "/usr/sbin/pdns_server", "--disable-syslog=yes", "--daemon=no" ]
