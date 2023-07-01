
ssh_authorized_keys:
  ssh_auth.manage:
    - user: root
    - enc: ssh-ed25519
    - ssh_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIUe9W/59j6yBXx0FTOWKpKTPXciGMw746ZErf7d8EJt leif.liddy@black.example.com
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFxHJJxPuAzo3H8DBd/xai6PLiK951hOBRlgbB83rnYd root@black.example.com
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4NU5CHu4XAkia/J6NSrunmffKa3Vq+GBL7tXDx91fJ leif.liddy@cloud.leifliddy.com
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdpPv6AUY3uOJRiK5ukdCYsmrr/6RWWR3lssVWVKsNG leif.liddy@mac.example.com

deploy_bashrc_stock:
  file.managed:
    - name:    /root/.bashrc
    - source: salt://files/bashrc_stock
    - user:   root
    - group:  root
    - mode:   644

create_bashrc_d:
  file.directory:
    - name:  /root/.bashrc.d
    - user:  root
    - group: root
    - mode:  755

deploy_bashrc_default:
  file.managed:
    - name:   /root/.bashrc.d/default
    - source: salt://files/bashrc_default_root
    - user:   root
    - group:  root
    - mode:   644

deploy_bashrc_podman:
  file.managed:
    - name:   /root/.bashrc.d/podman
    - source: salt://files/bashrc_podman
    - user:   root
    - group:  root
    - mode:   644

deploy_bashrc_rpmbuild:
  file.managed:
    - name:   /root/.bashrc.d/rpmbuild
    - source: salt://files/bashrc_rpmbuild
    - user:   root
    - group:  root
    - mode:   644

deploy_bashrc_salt:
  file.managed:
    - name:   /root/.bashrc.d/salt
    - source: salt://files/bashrc_salt
    - user:   root
    - group:  root
    - mode:   644

deploy_bashrc_git:
  file.managed:
    - name:   /root/.bashrc.d/git
    - source: salt://files/bashrc_git
    - user:   root
    - group:  root
    - mode:   644

deploy_vimrc:
  file.managed:
    - name:   /root/.vimrc
    - source: salt://files/vimrc
    - user:   root
    - group:  root
    - mode:   644

deploy_rpmmacros:
  file.managed:
    - name:   /root/.rpmmacros
    - source: salt://files/rpmmacros
    - user:   root
    - group:  root
    - mode:   644
