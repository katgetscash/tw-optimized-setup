#!/bin/bash
sed -i "s/GRUB_TIMEOUT=8/GRUB_TIMEOUT=0/g" /etc/default/grub
firewall-cmd --set-default-zone home
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O hosts
grep -E '^(\s*)[1-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s*.*\..*' hosts
mv hosts /etc
zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
zypper ar --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed/ snappy
zypper ar -cfp 90 https://download.opensuse.org/repositories/home:trmdi/openSUSE_Tumbleweed/home:trmdi.repo
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
zypper --gpg-auto-import-keys refresh
zypper ref && zypper dup -y
zypper in -y bleachbit brave-browser chromium clamav git flatpk htop icedtea-web remmina neofetch opi smartmontools thunderbird yakuake youtube-dl virtualbox gcc make perl kernel-devel dkms snapd inkscape krita scrot xbindkeys xdotool dolphin-plugins pgadmin4 postgresql postgresql-contrib sqliteman nodejs16 libreoffice-writer-extensions google-caladea-fonts
rm ~/.cache/icon-cache.kcache
git config --global user.name "katgetscash"
git config --global user.email "katgetscash@gmail.com"
runuser -l kat -c 'python -m ensurepip --user'
curl https://cli-assets.heroku.com/install.sh | sh
heroku login
opi codecs
opi ibm-plex
fc-cache -fv
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl enable snapd
systemctl start snapd
systemctl enable snapd.apparmor
snap install spotify
snap install android-studio --classic
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
