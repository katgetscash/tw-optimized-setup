#!/bin/bash -ve
# https://gist.github.com/MrDrMcCoy/74a03390620f7fdaff3d
trap exit INT TERM QUIT HUP ERR

# add tmpfs mount for better speed (no longer needed)
# grep ' /tmp ' /etc/fstab >/dev/null || sudo tee -a /etc/fstab <<< "tmpfs /tmp tmpfs noatime,nodiratime"
# sudo mount -v /tmp

##### remove sudo reauthentication tmeout
sudo sed -i.bak -e '$a\' -e 'Defaults timestamp_timeout=-1' -e '/Defaults timestamp_timeout=.*/d' /etc/sudoers

##### set better ssh defaults
mkdir -vp $HOME/.ssh
tee $HOME/.ssh/config <<< "
ForwardAgent no
IdentitiesOnly yes
IdentityFile $HOME/.ssh/home
LogLevel=ERROR
StrictHostKeyChecking=no
UserKnownHostsFile=/dev/null
" > /dev/null
chmod -Rv u=rwX,g=,o= $HOME/.ssh

sudo zypper dup -l --recommends --force-resolution

#### Add user to groups
for group in davfs2 docker input libvirt plugdev vboxusers ; do
  sudo gpasswd -a $USER $group
done

echo "You should probably reboot"
exit
