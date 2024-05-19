
deploy_slick_greeter_conf:
  file.managed:
    - user:   root
    - group:  root
    - mode:   644  
    - name:   /etc/lightdm/slick-greeter.conf
    - source: salt://lightdm/files/slick-greeter.conf



