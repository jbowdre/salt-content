# Save into salt://rename.sls then run the following command:
# salt-run state.orch rename pillar='{"old": "OLD_NAME", "new": "NEW_NAME"}'
#
# For more tips like this, follow https://twitter.com/SaltTips

{% set old_name = pillar['old'] %}
{% set new_name = pillar['new'] %}

Rename minion id:
  salt.function:
    - name: file.write
    - tgt: '{{ old_name }}'
    - arg:
        - /etc/salt/minion_id
        - '{{ new_name }}'

Restart minion:
  salt.function:
    - name: cmd.run
    - tgt: '{{ old_name }}'
    - arg:
        - 'salt-call service.restart salt-minion'
    - kwarg:
        bg: true

Rename minion key:
  module.run:
    - file.rename:
        - '/etc/salt/pki/master/minions/{{ old_name }}'
        - '/etc/salt/pki/master/minions/{{ new_name }}'

