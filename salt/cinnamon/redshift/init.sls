{% set user = salt['pillar.get']('user') %}

install_redshift:
  pkg.installed:
    - name: redshift

create_systemd_target_dir:
  file.directory:
    - name:  /home/{{ user }}/.config/systemd/user/default.target.wants
    - user:  {{ user }}
    - group: {{ user }}
    - mode: 755
    - makedirs: True    
    - require:
      - install_redshift

create_redshift_symlink:
  file.symlink:
    - name: /home/{{ user }}/.config/systemd/user/default.target.wants/redshift.service
    - target: /usr/lib/systemd/user/redshift.service
    - require:
      - create_systemd_target_dir    
    
deploy_redshift_applet:
  archive.extracted:
    - name: /home/{{ user }}/.local/share/cinnamon/applets
    - source: salt://cinnamon/redshift/files/qredshift-applet.tar
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - create_redshift_symlink       
    
deploy_redshift_config:
  archive.extracted:
    - name:   /home/{{ user }}/.cinnamon/configs
    - source: salt://cinnamon/redshift/files/qredshift-config.tar
    - user:  {{ user }}
    - group: {{ user }}
    - require:
      - create_redshift_symlink         
