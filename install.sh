#!/bin/bash

set -e

dnf install -y salt-minion rsync
echo 'file_client: local' > /etc/salt/minion.d/local.conf

mkdir -p /srv/{pillar,salt}
rsync -aHAX pillar/ /srv/pillar
rsync -aHAX salt/ /srv/salt

states='remix file_py ssh pam time dnf user root cinnamon.calendar gedit brave systems.mac_m1'

for state in $states
do
   salt-call state.sls $state
done
