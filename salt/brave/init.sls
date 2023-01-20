install_brave_brower_rpm_key:
  cmd.run:
    - name: rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

install_brave_brower_repo:
  cmd.run:
    - name: dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

install_brave_browser:
  pkg.installed:
    - name: brave-browser
