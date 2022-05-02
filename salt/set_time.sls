{% set timezone = 'Europe/Berlin' %}


set_timezone:
  cmd.run:
    - name: timedatectl set-timezone {{ timezone }}

enable_start_chronyd_service:
  service.running:
    - name:   chronyd
    - enable: true
