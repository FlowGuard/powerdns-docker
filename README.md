# PowerDNS docker containers

These PowerDNS containers are meant to be simple way to spawn PowerDNS in docker.
Based on alpine, with PowerDNS packages from edge.

All configuration file variables are taken from environment. Authoritative variables are prefixed `PDNS_AUTH`, 
for recursor the prefix is `PDNS_RECURSOR` 

## Authoritative
Authoritative server contains all backends available in alpine:

* bind
* gpgsql
* ldap
* gmysql
* gsqlite3
* pipe

```bash
docker run -p 53:53/udp -p 53:53 
    -e PDNS_AUTH_LAUNCH=bind 
    -e PDNS_AUTH_LOGLEVEL=9 
    pdns-authoritative:latest
```

## Recursor

```bash
docker run -p 53:53/udp -p 53:53  
    -e "PDNS_RECURSOR_FORWARD_ZONES_RECURSE=zone.com=1.2.3.4;2.3.4.5,another.net=3.4.5.6;4.5.6.7" 
    -e PDNS_RECURSOR_QUIET=no
    pdns-recursor:latest
```