#!/bin/bash
##https://cubiclenate.com/linux/system-configuration/pre-shared-ssh-key/
sudo zypper ar -cf 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' Packman
sudo zypper ar -cf 'http://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/' Mozilla
#sudo zypper ar -cf 'http://opensuse-guide.org/repo/openSUSE_Tumbleweed/' libdvdcss

sudo zypper refresh

sudo zypper dup --allow-vendor-change --from Packman

sudo zypper install --from Packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codecs libdvdcss2 faac faad2 x264

sudo zypper refresh
sudo zypper install flash-player
