#!/bin/sh

envtpl --keep-template /etc/pdns/pdns.conf.tpl

$*
