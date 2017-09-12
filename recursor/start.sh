#!/bin/sh

envtpl --keep-template /etc/pdns/recursor.conf.tpl

$*
