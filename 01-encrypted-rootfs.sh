#!/bin/bash
  touch /.root.key
  chmod 600 /.root.key
  sudo dd if=/dev/urandom of=/.root.key bs=1024 count=1
  sudo cryptsetup luksAddKey /dev/sda2 /.root.key  # replace /dev/sda1 with the root partition (`sudo fdisk -l` to see partitions)
  echo "Edit /etc/crypttab, find the row that pertains to the root partition by UUID and add the key file in the third column. (ex: cr_sda1 UUID=... /.root.key)"
  echo -e 'install_items+=" /.root.key "' | sudo tee --append /etc/dracut.conf.d/99-root-key.conf > /dev/null
  echo "/boot/ root:root 700" >> /etc/permissions.local
  chkstat --system --set
  mkinitrd
