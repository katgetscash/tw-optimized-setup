# tw-optimized-setup

## Tested bug free with package signing / GPG:
  > openSUSE Tumbleweed x86_64 
  > Kernel 5.13.0-1 Shell 5.1.8
  > KDE 5.22.3 KF5.83.0 QT 5.15.2 
  > X11 OpenGL 3.1 Render 
  > Thinkpad T440s Haswell-ULT i7-4600(4)
  
### Performs the following actions:
  
1) encrypted-rootfs.sh (
  * sets up single passphrase login prompt on fullly encrypted disk)
  * must be run as root
2) custom-apps.sh
  * decrease swappiness
  * set default firewall zone
  * grub timeout to zero
  * import and enable hosts file ad blocking (Steven Black default list)
  * configure Kwallet and Gnome Keyring PAM for single passphrase 
  * snap / flatpak install
  * fix for GTK global appmenu from home:/trmdi
  * brave-browser from repo
  * IBM/Plex install (optionally install nerd-fonts 'blex' for powerline-shell support)
  * clear font and icon cache
  * git --push matching (username, email, core editor, and autocorrect)
  * system update
  * YAST default application for x-rpm 
  * install basic apps:
    * bleachbit 
    * chromium 
    * clamav 
    * htop 
    * icedtea-web
    * remmina 
    * neofetch 
    * smartmontools 
    * thunderbird 
    * yakuake 
    * youtube-dl 
    * make 
    * perl 
    * kernel-devel 
    * dkms 
    * inkscape
    * krita
    * scrot 
    * xbindkeys 
    * xdotool 
    * dolphin-plugins 
    * pgadmin4 
    * postgresql 
    * postgresql-contrib 
    * sqliteman 
    * nodejs16
    * libreoffice 
    * libreoffice-writer-extensions 
    * google-caladea-fonts
  * snap install spotify
  * snap install android-studio
  * snap install slack
3) codecs.sh
  * install codecs:
    * repository setup
      * from packman:
        * ffmpeg 
        * gstreamer-plugins-{good,bad,ugly,libav} 
        * libavcodec-full 
        * vlc-codecs 
        * libdvdcss2 
        * faac 
        * faad2 
        * x264
      * mozilla 
      * libdvdcss
      * flash-player (non-oss) 
 4) heroku-misc.sh
  * ensurepip for python 2 (2.7, must manually disable EOL nag-messages if sources to .bashrc)
  * heroku
    * curl and install heroku cli-assets
    * heroku login (continue in browser)
  * freshclam systemctl (if error in systemd target please see bugreport and workaround here ###)
  * sublime text install from repo)
5) pre-shared-key.sh
  * generate ssh-rsa key
  * copy to remote server with SCP or other secure method when prompted
  * be sure id_rsa.pub is removed at end of script
