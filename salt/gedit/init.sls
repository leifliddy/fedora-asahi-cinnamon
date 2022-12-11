sls_yaml_highlighting_4:
  file.replace:
    - name:    /usr/share/gtksourceview-4/language-specs/yaml.lang
    - pattern: '^    <property name="globs">\*\.yaml;\*\.yml;</property>$'
    - repl:    '    <property name="globs">*.yaml;*.yml;*.sls;</property>'
    - backup:  .orig

sls_yaml_highlighting_5:
  file.replace:
    - name:    /usr/share/gtksourceview-5/language-specs/yaml.lang
    - pattern: '^    <property name="globs">\*\.yaml;\*\.yml;</property>$'
    - repl:    '    <property name="globs">*.yaml;*.yml;*.sls;</property>'
    - backup:  .orig
