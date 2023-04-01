{% set release = salt['grains.get']('osrelease') %}

exclude_remix_release:
  file.append:
    - name: /etc/yum.repos.d/group_asahi-fedora-remix-branding.repo
    - text: exclude=asahi-fedora-remix-logos asahi-fedora-remix-release*

remove_remix_release:
  cmd.run:
    - name:   rpm -e --nodeps asahi-fedora-remix-release asahi-fedora-remix-release-common asahi-fedora-remix-release-identity-basic
    - onlyif: rpm -qa | grep -E 'asahi-fedora-remix-release|asahi-fedora-remix-release-common|asahi-fedora-remix-release-identity-basic'

remove_remix_logos:
  cmd.run:
    - name: rpm -e --nodeps asahi-fedora-remix-logos
    - onlyif: rpm -q asahi-fedora-remix-logos

install_fedora_release:
  cmd.run:
    - name: dnf install -y --releasever={{ release }} fedora-release fedora-release-common fedora-release-identity-basic
    - unless: rpm -qa | grep -E 'fedora-release|fedora-release-common|fedora-release-identity-basic'
