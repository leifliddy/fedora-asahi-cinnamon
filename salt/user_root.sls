{% set user = 'root' %}

ssh_authorized_keys:
  ssh_auth.manage:
    - user: {{ user }}
    - enc: ssh-ed25519
    - ssh_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIUe9W/59j6yBXx0FTOWKpKTPXciGMw746ZErf7d8EJt leif.liddy@black.example.com
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4NU5CHu4XAkia/J6NSrunmffKa3Vq+GBL7tXDx91fJ leif.liddy@cloud.leifliddy.com
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdpPv6AUY3uOJRiK5ukdCYsmrr/6RWWR3lssVWVKsNG leif.liddy@mac.example.com

deploy_bashrc_stock:
  file.managed:
    - name:    /{{ user }}/.bashrc
    - source: salt://files/bashrc_stock
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644

create_bashrc_d:
  file.directory:
    - name:  /{{ user }}/.bashrc.d
    - user:  {{ user }}
    - group: {{ user }}
    - mode:  755

deploy_bashrc_default:
  file.managed:
    - name:   /{{ user }}/.bashrc.d/default
    - source: salt://files/{{ user }}/bashrc
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644

deploy_bashrc_podman:
  file.managed:
    - name:   /{{ user }}/.bashrc.d/podman
    - source: salt://files/bashrc_podman
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644

deploy_vimrc:
  file.managed:
    - name:   /{{ user }}/.vimrc
    - source: salt://files/vimrc
    - user:   {{ user }}
    - group:  {{ user }}
    - mode:   644
