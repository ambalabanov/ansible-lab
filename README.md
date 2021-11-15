# ansible-lab

## requirements

- parallels desktop
- vagrant
- vagrant-parallels plugin
- ansible

## install

```shell
$ vagrant up
$ vagrant ssh-config master >> ~/.ssh/config
$ cd playbooks
$ ansible-playbook -i master, 00-subscription.yml --ask-vault-pass
```
