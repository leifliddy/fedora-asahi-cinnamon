install_chrome_repo:
  file.managed:
    - name:     /etc/yum.repos.d/google-chrome.repo
    - source:   salt://chrome/files/google-chrome.repo
    - user:     root
    - group:    root
    - mode:     644

install_chrome_browser:
  pkg.installed:
    - name: google-chrome-stable
