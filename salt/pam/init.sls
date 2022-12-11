
pam_su_wheel_trust:
  file.uncomment:
    - name: /etc/pam.d/su
    - regex: 'auth\s+sufficient\s+pam_wheel.so\s+trust use_uid'

pam_su_wheel_require:
  file.uncomment:
    - name: /etc/pam.d/su
    - regex: 'auth\s+required\s+pam_wheel.so\s+use_uid'
