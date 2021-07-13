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
  ```bash
  mount /root/partition /mnt
  mkdir -p /mnt/boot/efi
  mount /efi/partition /mnt/boot/efi
  ```
  - If Dual booting with windows :
    ```bash
    mkdir /windows10
    mount /windows/partition /mnt/windows10
    ```

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

Add `/swapfile none swap defaults 0 0` to the `/etc/fstab` :

- Set your timezone :

```
ln -sf /usr/share/zoneinfo/Africa/Tunis /etc/localtime
hwclock --systohc
```

- Generate locales :
  - Uncomment `EN_US-utf-8` in **/etc/locale.gen** then run
  ```
  locale-gen
  ```

- Make all script files executable
- Check then run **base.sh**
- Create Root password with `passwd`

## Bootloader

- Edit /etc/default/grub and remove quiet flag. **If Dual booting, append this line to `/etc/default/grub`** : **GRUB_DISABLE_OS_PROBER=false**
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

- umount -a, exit and reboot.

# Post-Reboot

- Connect to your network with nmtui.
- run `post-reboot.sh`.
- Add nvidia and i915 (Intel) modules to `/etc/mkinitcpio.conf`.

```
sudo mkinitcpio -p linux
```

# Fixes and tips

## Tapping on Xorg (laptops)

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

## Java applications (DWM)

**[Source](https://wiki.archlinux.org/title/Dwm#Fixing_misbehaving_Java_applications)**

- Append `export _JAVA_AWT_WM_NONREPARENTING=1` to `/etc/profile.d/jre.sh`
- Append `export AWT_TOOLKIT=MToolkit` and `export _JAVA_AWT_WM_NONREPARENTING=1` to window manager start script (.xinitrc...)

## Switch default POSIX shell interpreter to Dash instead of Bash

- In order to improve portability and performance when executing POSIX compliant shell scripts, Download `dash` and link it symbolically to /usr/bin/sh. More information on this topic in the [Arch Wiki](https://wiki.archlinux.org/title/Dash).

```
# ln -sfT dash /usr/bin/sh
```

## Wayland
* Wayland is the next generation Display Protocol for Linux.The Linux ecosystem's transition to Wayland has been marching steadily forward through the years.

* There are some major applications that don't (or won't or can't) support Wayland. Programs like this can still be run in a Wayland environment through an isolated X instance called XWayland. This means that the transition to Wayland can be gradual: you won't lose access to older programs that you still need.

* To run Electron or Chromium based browsers in Wayland **(Discord hasn't yet switched to electron 12 to support Wayland)**, add the following flags :

```bash
brave/code --enable-features=UseOzonePlatform --ozone-platform=wayland
```
* Check which apps running on XWayland : 
```bash
xlsclients
```

* To enable screen sharting features, make sure you have `xdg-desktop-portal-wlr` and `libpipewire02` installed. When prompted for which screen, choose **Use operating system settings**. You cursor will change to indicate that you can choose the screen to share.

* More tips and info on Wayland in this [article](https://www.fosskers.ca/en/blog/wayland#orgcf32d8) and this [website](https://arewewaylandyet.com/).