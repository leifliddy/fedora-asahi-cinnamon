install_zram_pkgs:
  pkg.installed:
    - pkgs:
      - zram-generator
      - zram-generator-defaults
      
deploy_zram_config:
  file.managed:
    - name:   /etc/systemd/zram-generator.conf
    - source: salt://zram/files/zram-generator.conf
    - user:   root
    - group:  root
    - mode:   644
