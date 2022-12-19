{% set user = salt['pillar.get']('user') %}

{% set wallpaper_login =   'black_and_white_boat_darkness.jpg' %}
{% set wallpaper_desktop = 'blur_bokeh_dark.jpg' %}

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

deploy_wallpaper_to_usr_share_backgrounds:
  file.managed:
    - user:   root
    - group:  root
    - mode:   644
    - names:
      - /usr/share/backgrounds/images/{{ wallpaper_login }}:
        - source: salt://systems/mac_m1/files/{{ wallpaper_login }}
      - /usr/share/backgrounds/images/{{ wallpaper_desktop }}:
        - source: salt://systems/mac_m1/files/{{ wallpaper_desktop }}
        
set_desktop_wallpaper:
  file.managed:
    - user:     {{ user }}
    - group:    {{ user }}
    - mode:     644
    - dir_mode: 755
    - makedirs: True
    - names:
      - /home/{{ user }}/.local/share/shotwell/wallpaper/wallpaper.jpg:
        - source: salt://systems/mac_m1/files/{{ wallpaper_desktop }}
      - /home/{{ user }}/.local/share/shotwell/wallpaper/wallpaper_alt.jpg:
        - source: salt://systems/mac_m1/files/{{ wallpaper_desktop }}        

set_login_wallpaper:
  file.replace:
    - name:    /etc/lightdm/slick-greeter.conf
    - pattern: '^background=.*$'
    - repl:    'background=/usr/share/backgrounds/images/{{ wallpaper_login }}'
    - backup:  False

deploy_double_scaling_desktop_config:
  file.managed:
    - name:   /home/{{ user }}/.config/autostart/double-scaling.desktop
    - source: salt://systems/mac_m1/files/double-scaling.desktop
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
    - source: salt://systems/mac_m1/files/dconf_keyfile
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
