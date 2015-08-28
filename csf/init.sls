# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - csf.install
  - csf.config


csf_service:
  service:
    - name: csf
    - running
    - enable: True
    - watch:
      - file: /etc/csf/csf.conf
      - file: /etc/csf/csf.allow
      - file: /etc/csf/csf.deny
      - file: /etc/csf/csf.ignore
      - file: /etc/csf/csfpre.sh

# This controls CSF restarts - keep in mind that this will also enable it.
csf_reload:
  cmd.wait:
    - name: csf -r
    - watch:
      - service: csf

lfd:
  service:
    - running
    - enable: True
