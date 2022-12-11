restart_systemd_networkd_service:
  service.running:
    - name: systemd-networkd
    - reload: true
    - onlyif:
      - test systemctl is-active --quiet systemd-networkd

disable_network_manager:
  service.dead:
    - name: NetworkManager
    - enable: False
