{%- set csf = pillar.get('csf', {}) %}
{%- set config = csf.config|default({}) %}

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

#Blank CSFPRE to allow for watch
csf_csfpre:
  file.managed:
    - source: salt://csf/files/csfpre.sh
    - name: /etc/csf/csfpre.sh
