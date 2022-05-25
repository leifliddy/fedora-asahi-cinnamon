
dnf_default_yes:
  file.append:
    - name: /etc/dnf/dnf.conf
    - text: 
      - defaultyes=True
