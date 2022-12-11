deploy_negativo_repo:
  file.managed:
    - name:   /etc/yum.repos.d/negativo17-multimedia.repo
    - source: salt://repos/files/negativo17-multimedia.repo
    - user:   root
    - group:  root
    - mode:   644
