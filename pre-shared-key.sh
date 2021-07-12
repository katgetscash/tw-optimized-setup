#!/bin/bash
## source: https://cubiclenate.com/linux/system-configuration/pre-shared-ssh-key/
##https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

    ssh-keygen -t rsa
    echo "Copy the public key to your server"
    read -n 1 -s -r -p "Press any key to continue"
    mkdir ~/.ssh
    cd ~/.ssh
    scp id_rsa.pub kat@192.168.0.64:/home/kat/
    cat id_rsa.pub >> ~/.ssh/authorized_keys
    rm id_rsa.pub
