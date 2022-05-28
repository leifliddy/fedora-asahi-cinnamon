#!/bin/bash

set -e

dnf install -y salt-minion
echo 'file_client: local' > /etc/salt/minion.d/local.conf

mkdir -p /srv/salt
rsync -aHAX salt/ /srv/salt

states='install_rpmfusion_free pam_su user_leif user_root sshd install_cinnamon dnf set_time mac_m1'

for state in $states
do
   salt-call state.sls $state
done

# don't enable NetworkManager yet. Need to perform more testing.
systemctl disable --now NetworkManager.service
#systemctl disable --now iwd systemd-networkd
