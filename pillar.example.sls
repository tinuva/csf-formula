csf:
  # Common Subnets/Ports in csf.{allow|deny|ignore}
  common-ports:
    allow:
      nginx-http:
        desc: "NGINX HTTP"
        destination-port: 80
        direction: in
        protocol: tcp
        destination-address: 127.0.0.1
      nginx-https:
        desc: "NGINX HTTPS"
        destination-port: 443
        direction: in
        protocol: tcp
        destination-address: 127.0.0.1
      openssh-server:
        desc: "SSH Access"
        destination-port: 22
        direction: in
        protocol: tcp
        source-address: 192.168.10.1
      snmpd:
        desc: "SNMPD Access"
        destination-port: 53
        direction: in
        protocol: udp
        source-address: 192.168.10.1
      internal-net1:
        desc: "Internal NET1 Access"
        subnet: 10.0.0.0/8
    deny:
      hacker-1:
        desc: "Block hacker-1"
        destination-port: 22
        direction: in
        protocol: tcp
        source-address: 192.168.11.1
    ignore:
      emergency-subnet:
        desc: "Emergency Access"
        subnet: 11.0.0.0/8
#Individual Server Config {allow|deny|ignore}
  servers:
    "webserver":
      allow:
        nginx-http:
          desc: "NGINX HTTP"
          destination-port: 80
          direction: in
          protocol: tcp
          destination-address: 127.0.0.2
        nginx-https:
          desc: "NGINX HTTPS"
          destination-port: 443
          direction: in
          protocol: tcp
          destination-address: 127.0.0.2
        openssh-server:
          desc: "SSH Access"
          destination-port: 22
          direction: in
          protocol: tcp
          source-address: 192.168.10.2
        snmpd:
          desc: "SNMPD Access"
          destination-port: 53
          direction: in
          protocol: udp
          source-address: 192.168.10.2
        internal-net1:
          desc: "Internal NET1 Access"
          subnet: 10.0.0.0/8
      deny:
        hacker-1:
          desc: "Block hacker-1"
          destination-port: 22
          direction: in
          protocol: tcp
          source-address: 192.168.11.2
      ignore:
        emergency-subnet:
          desc: "Emergency Access"
          subnet: 11.0.0.0/8

  config:
    tcp_in: '20,21,22,25,26,53,80,110,143,161,199,443,465,587,993,995,2077,2078,2082,2083,2086,2087,2095,2096,2195,953,30000:35000,3306,3307,8080,111,2049'
    tcp_out: '20,21,22,25,26,37,43,53,80,110,113,161,199,443,587,873,993,2087,2089,2195,2703,953,3306,3307,8080,111,2049'
    udp_in: '20,21,53'
    udp_out: '20,21,53,113,123,873,6277'
    tcp6_in: "22,25,53,110,143,443,465,587"
    tcp6_out: "22,25,53,110,113,443,587"
    udp6_in: "53"
    udp6_out: "53,113"
    icmp_in_rate: "1/s"
    use_conntrack: "0"
    syslog_check: "3600"
    relayhosts: "1"
    deny_ip_limit: "1000"
    smtp_block: "1"
    smtp_ports: "25"
    drop_out_logging: "0"
    lf_permblock: "0"
    lf_permblock_alert: "0"
    lf_netblock_alert: "0"
    safechainupdate: "1"
    lf_trigger_perm: "300"
    lf_select: "1"
    lf_email_alert: "0"
    lf_sshd_perm: "900"
    lf_ftpd: "20"
    lf_ftpd_perm: "300"
    lf_smtpauth: "20"
    lf_smtpauth_perm: "300"
    lf_eximsyntax: "50"
    lf_eximsyntax_perm: "300"
    lf_pop3d: "10"
    lf_pop3d_perm: "300"
    lf_imapd: "10"
    lf_imapd_perm: "300"
    lf_htaccess: "10"
    lf_htaccess_perm: "300"
    lf_cpanel: "20"
    lf_cpanel_perm: "300"
    lf_modsec: "10"
    lf_modsec_perm: "300"
    lf_ssh_email_alert: "0"
    lf_console_email_alert: "1"
    lf_script_alert: "1"
    lf_queue_alert: "0"
    lf_interval: "300"
    lf_parse: "20"
    lt_pop3d: "100"
    rt_relay_alert: "0"
    rt_authrelay_alert: "0"
    rt_localrelay_alert: "0"
    rt_localhostrelay_alert: "0"
    ct_email_alert: "0"
    pt_all_users: "1"
    pt_userproc: "0"
    pt_usermem: "500"
    pt_usertime: "18000"
    pt_userkill_alert: "0"
    pt_apachestatus: "http://127.0.0.1/whm-server-status"
    ps_interval: "120"
    ps_ports: "0:1025,ICMP"
    ps_email_alert: "0"
    ui: "1"
    ui_port: "6767"
    ui_user: "username"
    ui_pass: "password"
    ui_alert: "0"
    ui_cxs: "1"
    ui_cse: "1"
    messenger: "1"
    portknocking_alert: "1"
    st_system: "1"
    st_mysql: "1"
    st_diskw_dd: "if=/dev/zero of=/etc/csf/dd_test bs=1MB count=64 conv=fdatasync"
    htaccess_log: "/usr/local/apache/logs/error_log"
    modsec_log: "/usr/local/apache/logs/error_log"
    sshd_log: "/var/log/secure"
    su_log: "/var/log/secure"
    smtpauth_log: "/var/log/exim_mainlog"
    pop3d_log: "/var/log/maillog"
    imapd_log: "/var/log/maillog"
    webmin_log: "/var/log/secure"
    custom1_log: "/var/log/messages"
    custom2_log: "/var/log/messages"
    custom3_log: "/var/log/messages"
    custom4_log: "/var/log/messages"
    custom5_log: "/var/log/messages"
    custom6_log: "/var/log/messages"
    custom7_log: "/var/log/messages"
    custom8_log: "/var/log/messages"
    custom9_log: "/var/log/messages"
    ports_bind: "53"
