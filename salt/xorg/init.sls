deploy_xorg_config:
  file.managed:
    - name:   /etc/X11/xorg.conf.d/30-modeset.conf
    - source: salt://xorg/files/30-modeset.conf
    - user:   root
    - group:  root
    - mode:   644
