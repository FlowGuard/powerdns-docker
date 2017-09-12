{% for key, value in environment('PDNS_AUTH_') %}{{ key|lower|replace('_','-') }}={{ value }}
{% endfor %}
