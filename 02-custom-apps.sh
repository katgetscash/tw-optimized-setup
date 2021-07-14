#!/usr/bin/env bash
## some snips from https://github.com/Liemaeu/openSUSE-Tumbleweed-Basics-Installer

## Set swappiness to 10
/bin/su -c "echo -e 'vm.swappiness=10' >> /etc/sysctl.conf"

## Firewall zone
sudo firewall-cmd --set-default-zone home

## Grub timeout
sudo sed -i "s/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/" /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

## Host file ad-blocking
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O hosts
grep -E '^(\s*)[1-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s*.*\..*' hosts
sudo mv hosts /etc

## Kwallet
sudo zypper --non-interactive install -y pam_kwallet

## Gnome-Keyring
sudo zypper --non-interactive install -y gnome-keyring seahorse
if ! [ grep -Fxq "pam_gnome_keyring.so" "/etc/pam.d/sddm" ]; then
  sudo sed -i "/common-auth/a auth	optional	pam_gnome_keyring.so" /etc/pam.d/sddm
  sudo sed -i "/common-session/a session	optional	pam_gnome_keyring.so auto_start" /etc/pam.d/sddm
fi

## Snap
sudo zypper --non-interactive ar --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper --non-interactive dist-upgrade --from snappy
sudo zypper --non-interactive install snapd
sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.apparmor

#installs flatpak
sudo zypper --non-interactive install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

## Fix GTK global appmenu
sudo zypper addrepo -p 95 https://download.opensuse.org/repositories/home:/trmdi/openSUSE_Tumbleweed/home:trmdi.repo
sudo zypper --gpg-auto-import-keys refresh
sudo zypper --non-interactive dup --allow-vendor-change --from trmdi
sudo zypper --non-interactive install -f --recommends  applet-window-appmenu

## Brave browser
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper --non-interactive addrepo --refresh https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
sudo zypper --gpg-auto-import-keys refresh
sudo zypper --non-interactive in brave-browser

## IBM/Plex
sudo zypper --non-interactive addrepo https://download.opensuse.org/repositories/M17N:fonts/openSUSE_Tumbleweed/M17N:fonts.repo
sudo zypper --gpg-auto-import-keys refresh
sudo zypper --non-interactive in ibm-plex-sans-fonts ibm-plex-mono-fonts  ibm-plex-serif-fonts
rm ~/.cache/icon-cache.kcache
sudo fc-cache -fv

## git --push matching
sudo zypper --non-interactive in git
git config --global user.name "katgetscash"
git config --global user.email "katgetscash@gmail.com"
git config --global core.editor nano
git config --global help.autocorrect 20

## Update
sudo zypper --non-interactive refresh
sudo zypper --non-interactive dist-upgrade --allow-vendor-change


## sets YaST Software as default application for .rpm
if ! [ -f "$HOME/.config/mimeapps.list" ]; then
  echo "[Default Applications]" > $HOME/.config/mimeapps.list
fi
if ! [ grep -Fxq "application/x-rpm=org.opensuse.yast.Packager.desktop" "$HOME/.config/mimeapps.list" ]; then
  sed -i "/Default Applications/a application/x-rpm=org.opensuse.yast.Packager.desktop;" $HOME/.config/mimeapps.list
fi

sudo zypper in -y bleachbit chromium clamav htop icedtea-web remmina neofetch smartmontools thunderbird yakuake youtube-dl make perl kernel-devel dkms inkscape krita scrot xbindkeys xdotool dolphin-plugins pgadmin4 postgresql postgresql-contrib sqliteman nodejs16 libreoffice libreoffice-writer-extensions google-caladea-fonts

snap install spotify
snap install android-studio --classic
snap install slack --classic
