install_rpmfusion_nonfree:
  pkg.installed:
    - sources:
      - rpmfusion-nonfree-release: https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-{{ grains.osrelease }}.noarch.rpm
