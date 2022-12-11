{% set cpuarch = salt['grains.get']('cpuarch') %}

install_brave_brower_rpm_key:
  cmd.run:
    - name: rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

{% if cpuarch == 'x86_64' %}
install_brave_brower_repo:
  cmd.run:
    - name: dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

install_brave_browser:
  pkg.installed:
    - name: brave-browser

{% elif cpuarch == 'aarch64' %}
install_brave_browser:
 pkg.installed:
   - sources:  
     - brave-browser-nightly: https://github.com/brave/brave-browser/releases/download/v1.48.24/brave-browser-nightly-1.48.24-1.aarch64.rpm

{% endif %}
