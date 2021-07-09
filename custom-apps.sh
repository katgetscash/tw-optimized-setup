#!/bin/bash
sed -i "s/GRUB_TIMEOUT=8/GRUB_TIMEOUT=0/g" /etc/default/grub
firewall-cmd --set-default-zone home
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O hosts
grep -E '^(\s*)[1-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s*.*\..*' hosts
mv hosts /etc
zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
zypper ar --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed/ snappy
zypper ar -cfp 90 https://download.opensuse.org/repositories/home:trmdi/openSUSE_Tumbleweed/home:trmdi.repo
zypper --gpg-auto-import-keys refresh
zypper ref && zypper dup -y
zypper in -y bleachbit chromium clamav git flatpk htop remmina neofetch opi smartmontools thunderbird yakuake youtube-dl virtualbox gcc make perl kernel-devel dkms snapd
opi codecs
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl enable snapd
systemctl start snapd
systemctl enable snapd.apparmor
snap install spotify
snap install slack --classic
systemctl start freshclam
systemctl enable freshclam
mkdir git-downloads
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
zypper install -y sublime-text
zypper ref && zypper dup -y --allow-vendor-change
/bin/su -c "echo -e 'vm.swappiness=10' >> /etc/sysctl.conf"
zypper rm -y discover discover-backend-flatpak discover-backend-packagekit discover-lang discover-backend-fwupd
zypper al  discover discover-backend-flatpak discover-backend-packagekit discover-lang discover-backend-fwupd
