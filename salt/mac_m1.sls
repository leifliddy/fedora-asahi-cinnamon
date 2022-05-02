{% set user = 'leif.liddy' %}


ensure_autostart_dir_exists:
  file.directory:
    - name:     /home/{{ user }}/.config/autostart
    - user:     {{ user }}
    - group:    {{ user }}
    - mode:     755
    - makedirs: true

ensure_dconf_dir_exists:
  file.directory:
    - name:     /home/{{ user }}/.config/dconf
    - user:     {{ user }}
    - group:    {{ user }}
    - mode:     755

ensure_themes_dir_exists:
  file.directory:
    - name:     /home/{{ user }}/.themes
    - user:     {{ user }}
    - group:    {{ user }}
    - mode:     755

deploy_adapta_nokto_theme:
  archive.extracted:
    - name:   /home/{{ user }}/.themes
    - source: salt://files/mac_m1/Adapta-Nokto.tar.bz2
    - user:   {{ user }}
    - group:  {{ user }}

deploy_double_scaling_desktop_config:
  file.managed:
    - name:    /home/{{ user }}/.config/autostart/double-scaling.desktop
    - source: salt://files/mac_m1/double-scaling.desktop
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644

create_tmp_dconf_dir:
  file.directory:
    - name:  /tmp/{{ user }}_dconf
    - user:  {{ user }}
    - group: {{ user }}

deploy_dconf_config:
  file.managed:
    - name:   /tmp/{{ user }}_dconf/dconf_keyfile
    - source: salt://files/mac_m1/dconf_keyfile
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644

compile_dconf_config:
  cmd.run:
    - name: dconf compile /home/{{ user }}/.config/dconf/user /tmp/{{ user }}_dconf

remove_tmp_dconf_dir:
  file.absent:
    - name: /tmp/{{ user }}_dconf
    - require:
      - compile_dconf_config
