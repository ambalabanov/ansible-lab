# ansible-lab

## requirements

- parallels desktop
- vagrant
- vagrant-parallels plugin
- ansible

## install

```shell
$ vagrant up
...
Vault password:
...
$ vagrant ssh master
$ cd /vagrant/playbooks/
$ ansible all -m ping -o
node2.example.com | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/libexec/platform-python"},"changed": false,"ping": "pong"}
node1.example.com | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/libexec/platform-python"},"changed": false,"ping": "pong"}
node4.example.com | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/libexec/platform-python"},"changed": false,"ping": "pong"}
node3.example.com | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/libexec/platform-python"},"changed": false,"ping": "pong"}
master.example.com | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/libexec/platform-python"},"changed": false,"ping": "pong"}
```

## hosts

| VM name  | Hostname           | IP private    |Role          |
| -------- | ------------------ | ------------- | ------------ |
| master   | master.example.com | 192.168.55.10 | control host |
| node1    | node1.example.com  | 192.168.55.11 | managed host |
| node2    | node2.example.com  | 192.168.55.12 | managed host |
| node3    | node3.example.com  | 192.168.55.13 | managed host |
| node4    | node4.example.com  | 192.168.55.14 | managed host |

