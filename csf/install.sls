### if centos6 include iptables-ipv6
### if centos7 include wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph

{%- from "csf/map.jinja" import csf with context %}

csf_req_pakages:
  pkg.installed:
    - pkgs: {{ csf.pkgs }}
    - require_in:
      - '*'

csf_install:
  cmd.run:
    {% if grains['panel'] is defined %}
      {% if grains['panel'] == "directadmin" %}
    - name: wget http://www.configserver.com/free/csf.tgz && tar xvf csf.tgz && cd csf && bash ./install.directadmin.sh && rm -rf /tmp/csf.tgz && rm -rf /tmp/csf
      {% else %}
    - name: wget http://www.configserver.com/free/csf.tgz && tar xvf csf.tgz && cd csf && bash ./install.sh && rm -rf /tmp/csf.tgz && rm -rf /tmp/csf
      {% endif %}
      {% else %}
    - name: wget http://www.configserver.com/free/csf.tgz && tar xvf csf.tgz && cd csf && bash ./install.sh && rm -rf /tmp/csf.tgz && rm -rf /tmp/csf
      {% endif %}
    - cwd: /tmp
    - creates: /etc/csf


