{% set user = salt['pillar.get']('user') %}
    
deploy_calendar_config:
  archive.extracted:
    - name:   /home/{{ user }}/.cinnamon/configs
    - source: salt://cinnamon/calendar/files/calendar-config.tar
    - user:  {{ user }}
    - group: {{ user }}
    - overwrite: True
