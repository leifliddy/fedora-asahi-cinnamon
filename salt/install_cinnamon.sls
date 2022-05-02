
# pkg.group_installed doesn't currently work for environmental groups like 'Cinnamon Desktop'
# using cmd.run for now....

install_cinnamon_group:
  cmd.run:
    - name: dnf group install -y 'Cinnamon Desktop'

remove_pkgs:
  pkg.removed:
    - pkgs:
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
      - evince
      - gedit
      - git
      - kernel-devel
      - mpv
      - podman
      - podman-docker
      - python3-pip
      - python3-podman
      - python3-termcolor
      - python3-wheel
      - salt-minion
      - speedtest-cli
      - wireguard-tools
      - x2goserver
      - x2goserver-desktopsharing
      - xdotool
      - xinput
      - youtube-dl


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
