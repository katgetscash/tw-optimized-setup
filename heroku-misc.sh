#!/bin/bash
runuser -l kat -c 'python -m ensurepip --user'
curl https://cli-assets.heroku.com/install.sh | sh
heroku login

systemctl start freshclam
systemctl enable freshclam
mkdir git-downloads
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
zypper install -y sublime-text
zypper ref && zypper dup -y --allow-vendor-change
