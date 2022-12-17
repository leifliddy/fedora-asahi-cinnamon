{% set timezone = salt['pillar.get']('timezone') %}

install_chrony:
  pkg.installed:
    - name: chrony

set_timezone:
  cmd.run:
    - name: timedatectl set-timezone {{ timezone }}

enable_start_chronyd_service:
  service.running:
    - name:   chronyd
    - enable: true
