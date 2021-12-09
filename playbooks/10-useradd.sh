#!/usr/bin/env bash
# run under vagrant user
sudo ansible all -b -u root -m user -a "name=vagrant password={{ 'vagrant' | password_hash('sha512','salt') }} generate_ssh_key=yes"
sudo ansible all -b -u root -m copy -a "content='vagrant ALL=(ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/vagrant"
HOSTS=$(ansible all --list-hosts |tail -n 5)
rm /home/vagrant/.ssh/known_hosts
for HOST in $HOSTS
do
    ssh-keyscan $HOST >> ~/.ssh/known_hosts 2>/dev/null
done
ansible all -m file -a "path=/home/vagrant/.ssh state=directory mode=0700" -e "ansible_user=vagrant ansible_password=vagrant"
ansible all -m authorized_key -a "user=vagrant key={{ lookup('file', '/home/vagrant/.ssh/id_rsa.pub') }} state=present" -e "ansible_user=vagrant ansible_password=vagrant"
ansible all -m ping
