
deploy_sshd_base_restrict:
  file.managed:
    - name:   /etc/ssh/sshd_config.d/10-base-restrict.conf
    - source: salt://ssh/files/sshd_config
    - user:   root
    - group:  root
    - mode:   600

enable_reload_sshd_service:
  service.running:
    - name: sshd
    - enable: true
    - reload true:
    - watch:
      - deploy_sshd_base_restrict
