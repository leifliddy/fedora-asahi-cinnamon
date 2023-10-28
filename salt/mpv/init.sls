{% set user = salt['pillar.get']('user') %}

deploy_mpv_config:
  file.managed:
    - user:     {{ user }}
    - group:    {{ user }}
    - mode:     644
    - dir_mode: 755
    - makedirs: True
    - names:
      - /home/{{ user }}/.mpv/config:
        - source: salt://mpv/files/config
      - /home/{{ user }}/.mpv/input.conf:
        - source: salt://mpv/files/input.conf

create_mpv_subtitle_dir:
  file.directory:
    - name:  /home/{{ user }}/.mpv/sub
    - user:  {{ user }}
    - group: {{ user }}
    - mode:  755
