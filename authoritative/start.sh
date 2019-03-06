#!/bin/bash

if [ -f /etc/pdns/pdns.conf.tpl -a "x${!PDNS_AUTH_}" != "x" ]; then
	envtpl --keep-template /etc/pdns/pdns.conf.tpl
elif [ ! -f /etc/pdns/pdns.conf ]; then
	touch /etc/pdns/pdns.conf
fi

exec $*
