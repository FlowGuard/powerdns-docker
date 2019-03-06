#!/bin/bash

if [ -f /etc/pdns/recursor.conf.tpl -a "x${!PDNS_RECURSOR_}" != "x" ]; then
	envtpl --keep-template /etc/pdns/recursor.conf.tpl
elif [ ! -f /etc/pdns/recursor.conf ]; then
	touch /etc/pdns/recursor.conf
fi

exec $*
