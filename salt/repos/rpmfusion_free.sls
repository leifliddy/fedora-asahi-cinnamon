install_rpmfusion_free:
  pkg.installed:
    - sources:
      - rpmfusion-free-release: https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-{{ grains.osrelease }}.noarch.rpm
