#!/bin/bash
ln /usr/bin/kioclient5 /usr/bin/kfmclient
ln /usr/bin/kwriteconfig5 /usr/bin/kwriteconfig
ln -s /etc/mime.types /home/kat/.config/mimeapps.list
kwriteconfig5 --file kdeglobals --group KDE --key SingleClick false
xdg-mime default org.opensuse.yast.Packager.desktop application/x-rpm
xdg-settings set default-web-browser chromium.desktop
