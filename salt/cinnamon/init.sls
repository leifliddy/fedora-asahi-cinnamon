{% set admin = salt['pillar.get']('admin') %}

include:
  - repos.rpmfusion_free
  {% if admin %}  
  - repos.negativo
  {% endif %}

install_systemd-resolved:
  pkg.installed:
    - name: systemd-resolved

enable_start_systemd_resolved_service:
  service.running:
    - name:   systemd-resolved
    - enable: true
    - watch:
      - install_systemd-resolved

# pkg.group_installed doesn't currently work for environmental groups like 'Cinnamon Desktop'
# using this method for now....

{% set install_groups = salt['pkg.group_info']('Cinnamon Desktop')['mandatory'] %}
# don't install the Guest Desktop Agents group
{% set index = install_groups.index("Guest Desktop Agents") %}
{% set tmp = install_groups.pop(index) %}

{#{% do salt.log.warning('install_groups: ' ~ install_groups) %}#}

{% for group in install_groups %}
install_{{ group }}:
  pkg.group_installed: 
    - name: {{ group }}
{% endfor %}


remove_pkgs:
  pkg.removed:
    - pkgs:
      - device-mapper-multipath
      - dnfdragora
      - dnfdragora-updater
      - eom
      - hexchat
      - nano
      - onboard
      - open-vm-tools-desktop
      - parole
      - pidgin
      - redshift
      - rhythmbox
      - spice-vdagent
      - thunderbird
      - transmission
      - xawtv
      - xed
      - xfburn
      - xreader  

add_pkgs:
  pkg.installed:
    - pkgs:
      - evince
      - gedit
      - gedit-plugin-codecomment
      - git
      - libreoffice
      - mpv
      - salt-minion
      - speedtest-cli
      - wireguard-tools
      - x2goserver
      - x2goserver-desktopsharing
      - xdotool
      - xinput
      - youtube-dl

{% if admin %}
add_admin_pkgs:
  pkg.installed:
    - pkgs:
      - fedpkg
      - kernel-devel
      - krb5-workstation      
      - podman
      - podman-docker
      - python3-pip
      - python3-podman
      - python3-termcolor
      - python3-wheel
      - rpmdevtools
      - Signal-Desktop
      - x2goclient
{% endif %}
