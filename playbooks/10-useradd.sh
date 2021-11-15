#! /bin/bash

ansible all -m user -a "name=vagrant state=present generate_ssh_key=yes"
ansible all -m file -a "path=/home/vagrant/.ssh state=directory mode=700"
ansible all -m copy -a 'content="vagrant ALL=(ALL) NOPASSWD:ALL\n" dest=/etc/sudoers.d/vagrant'
ansible all -m authorized_key -a "user=vagrant key={{ lookup('file', '/home/vagrant/.ssh/id_rsa.pub') }} state=present"

