{% set user = salt['pillar.get']('user') %}

install_touchegg:
  pkg.installed:
    - name: touchegg

enable_start_systemd_touchegg:
  service.running:
    - name:   touchegg
    - enable: true

deploy_touchegg_config:
  file.managed:
    - name:     /home/{{ user }}/.config/touchegg/touchegg.conf
    - source:   salt://touchegg/files/touchegg.conf
    - user:     {{ user }}
    - group:    {{ user }}
    - makedirs: True

deploy_touchegg_client_service_config:
  file.managed:
    - name:     /home/{{ user }}/.config/systemd/user/touchegg-client.service
    - source:   salt://touchegg/files/touchegg-client.service
    - user:     {{ user }}
    - group:    {{ user }}
    - makedirs: true

create_systemd_target_symlink:
  file.symlink:
    - name:     /home/{{ user }}/.config/systemd/user/default.target.wants/touchegg-client.service
    - target:   /home/{{ user }}/.config/systemd/user/touchegg-client.service
    - user:     {{ user }}
    - group:    {{ user }}
    - makedirs: true
