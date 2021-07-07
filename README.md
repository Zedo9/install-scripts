# About

This repo is a guide I created for installing Arch Linux (Or any other distro if you want) from scratch. It inculdes several scripts for installing the main tools I use on my different machines split into different categories and some tips and tricks for fixing common problems (Dual boot - Trackpads...).

- All information is extrated and heavily inspired by the Arch Wiki.

# Getting started

- loadkeys fr
- Check if you have Internet by pinging a website
- If installing with wifi use iwctl to connect to your wifi network

```
iwctl
device list
station <device_name> scan
station <device_name> get-networks
station <device_name> connect <SSID>
exit
```

- pacman -Syyy
- timedatectl set-ntp true

# Preparing Partitions

- Create partitions with cfdisk / cgdisk
- Format partitions vfat and ext4 (EFI At least 300M)
- Mount partitions :
  - mount /root/partition /mnt
  - mkdir -p /mnt/boot/efi
  - mount /efi/partition /mnt/boot/efi
  - If Dual booting with windows :
    - mkdir /windows10
    - mount /windows/partition /mnt/windows10

# Base system

## Install base packages

- Install base system :

```
pacstrap /mnt base linux linux-firmware neovim git intel-ucode amd-ucode
```

- Create File system table :

```
genfstab -U /mnt >> /mnt/etc/fstab
```

- Chroot into the new installation

```
arch-chroot /mnt
```

- Create swapfile if wanted :
  - Using fallocate (deprecated method) :
  ```
  fallocate -l 4GB /swapfile
  ```
  - Using dd :
  ```
  dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
  ```

```
chmod 600 /swapfile
mkswap /swapfile
```

Add `/swapfile none swap defaults 0 0` to the /etc/fstab :

- Set your timezone :

```
ln -sf /usr/share/zoneinfo/Africa/Tunis /etc/localtime
hwclock --systohc
```

- Generate locales :
  Uncomment `EN_US-utf-8` in **/etc/locale.gen** then run

```
locale-gen
```

- Make all script files executable
- Check then run **base.sh**
- Create Root password with `passwd`

## Bootloader

- Edit /etc/default/grub and remove quiet flag.
  If Dual booting, append this line to `/etc/default/grub` :
  **GRUB_DISABLE_OS_PROBER=false**
- Install Grub (For EFI) :

```
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

- Create grub config :

```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Add a user

```
useradd -mG wheel,audio,video,input zedo
passwd zedo
usermod -c "Chedly" Zedo
```

- Allow wheel group to run commands with sudo by uncommenting `%wheel ALL=(ALL) ALL`

```
EDITOR=nvim visudo
```

- umount -a, exit and reboot

# Post-Reboot

- Connect to your network with nmtui
- run `post-reboot.sh`
- Add nvidia and i915 (Intel) modules to `/etc/mkinitcpio.conf`

```
sudo mkinitcpio -p linux
```

# Fixes

## Tapping (laptops)

- Create a new file under `/etc/X11/xorg.conf.d/30-touchpad.conf`
- Paste the following inside it :

```
Section "InputClass"
Identifier "touchpad"
Driver "libinput"
MatchIsTouchpad "on"
Option "ClickMethod" "clickfinger"
Option "Tapping" "on"
Option "TappingButtonMap" "lrm"
EndSection
```

- More information [here](https://wiki.archlinux.org/title/Libinput) and [here](https://man.archlinux.org/man/libinput.4#CONFIGURATION_DETAILS).

## Java applications

**[Source](https://wiki.archlinux.org/title/Dwm#Fixing_misbehaving_Java_applications)**

- Append `export _JAVA_AWT_WM_NONREPARENTING=1` to `/etc/profile.d/jre.sh`
- Append `export AWT_TOOLKIT=MToolkit` and `export _JAVA_AWT_WM_NONREPARENTING=1` to window manager start script (.xinitrc...)
