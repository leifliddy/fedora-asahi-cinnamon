# needed for python 3.11 until this PR gets merged
# https://github.com/saltstack/salt/pull/62677

update_file_py_for_python3_11:
  cmd.run: 
    - name: wget https://raw.githubusercontent.com/saltstack/salt/28669dd9bb280f0ee86d009560dc087d5253a287/salt/modules/file.py -O /usr/lib/python3.11/site-packages/salt/modules/file.py
    - onlyif: test -f /usr/lib/python3.11/site-packages/salt/modules/file.py
