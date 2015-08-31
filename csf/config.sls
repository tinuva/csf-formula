{%- from "csf/map.jinja" import csf with context %}
{%- set config = csf.config|default({}) %}

{%- from "csf/cluster.yaml" import cluster %}
{%- if config.cluster_config is defined %}
{%- set cluster_config = config.cluster_config %}
{%- else %}
{%- set cluster_config = cluster.cluster_config %}
{%- endif %}

{%- if config.cluster_sendto is defined %}
{%- set cluster_sendto = config.cluster_sendto %}
{%- else %}
{%- set cluster_sendto = cluster.cluster_sendto %}
{%- endif %}

{%- if config.cluster_recvfrom is defined %}
{%- set cluster_recvfrom = config.cluster_recvfrom %}
{%- else %}
{%- set cluster_recvfrom = cluster.cluster_recvfrom %}
{%- endif %}

{%- if config.cluster_master is defined %}
{%- set cluster_master = config.cluster_master %}
{%- else %}
{%- set cluster_master = cluster.cluster_master %}
{%- endif %}

csf_ignore:
  file.managed:
    - source: salt://csf/files/csf.ignore
    - name: /etc/csf/csf.ignore
    - user: root
    - group: root
    - mode: 664
    - template: jinja

csf_allow:
  file.managed:
    - source: salt://csf/files/csf.allow
    - name: /etc/csf/csf.allow
    - user: root
    - group: root
    - mode: 664
    - template: jinja
csf_deny:
  file.managed:
    - source: salt://csf/files/csf.deny
    - name: /etc/csf/csf.deny
    - user: root
    - group: root
    - mode: 664
    - template: jinja

csf_config:
  file.managed:
    - source: salt://csf/files/csf.conf
    - name: /etc/csf/csf.conf
    - user: root
    - group: root
    - mode: 664
    - template: jinja
    - context:
        config: {{ config }}
        cluster_config: {{ cluster_config }}
        cluster_sendto: {{ cluster_sendto }}
        cluster_recvfrom: {{ cluster_recvfrom }}
        cluster_master: {{ cluster_master }}

#Blank CSFPRE to allow for watch
csf_csfpre:
  file.managed:
    - source: salt://csf/files/csfpre.sh
    - name: /etc/csf/csfpre.sh
