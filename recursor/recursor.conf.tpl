{% for key, value in environment('PDNS_RECURSOR_') %}{{ key|lower|replace('_','-') }}={{ value }}
{% endfor %}
