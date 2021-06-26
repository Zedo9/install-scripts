#!/bin/sh

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp 
# systemctl enable fstrim.timer
# systemctl enable libvirtd
# systemctl enable firewalld
systemctl enable acpid
