ambalabanov.localrepo
=========

Create local repositories from DVD

Requirements
------------

Attach rhel-8.4-x86_64-dvd.iso 

Role Variables
--------------

`reponode: master.example.com`

Dependencies
------------

No dependencies

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
---
- name: configure repos
  hosts: all
  roles:
    - role: ambalabanov.localrepo
      vars:
      - reponode: master.example.com
```

License
-------

BSD

Author Information
------------------

Andrey Balabanov
