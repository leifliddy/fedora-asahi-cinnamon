# update all packages
update_pkgs:
  pkg.uptodate:
    - refresh : True

# pkg.group_installed doesn't currently work for environmental groups like 'Cinnamon Desktop'
# using cmd.run for now....
install_cinnamon_group:
  cmd.run:
    - name: dnf group install -y 'Cinnamon Desktop'

restart_systemd_resolved_service:
  service.running:
    - name: systemd-resolved
    - watch:
      - install_cinnamon_group

restart_systemd_networkd_service:
  service.running:
    - name: systemd-networkd
    - reload: true
    - watch:
      - install_cinnamon_group
    - onlyif:
      - test systemctl is-active --quiet systemd-networkd

remove_pkgs:
  pkg.removed:
    - pkgs:
      - device-mapper-multipath
      - dnfdragora
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
      - blueberry
      - evince
      - gedit
      - gedit-plugin-codecomment
      - git
      - kernel-devel
      - mpv
      - nmap
      - podman
      - podman-docker
      - python3-pip
      - python3-podman
      - python3-termcolor
      - python3-wheel
      - redshift
      - rpmdevtools
      - salt-minion
      - speedtest-cli
      - telnet
      - wireguard-tools
      - x2goclient
      - x2goserver
      - x2goserver-desktopsharing
      - xdotool
      - xinput
      - youtube-dl

disable_lvm2_monitor_service:
  service.dead:
    - name: lvm2-monitor

#mask_systemd_udev_settle_service:
#  service.masked:
#    - name: systemd-udev-settle

# sadly aarch64 is not supported (yet)
#install_brave_brower_repo:
#  cmd.run:
#    - name: dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

#install_brave_brower_rpm_key:
#  cmd.run:
#    - name: rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

#install_brave_browser:
#  pkg.installed:
#    - name: brave-browser
