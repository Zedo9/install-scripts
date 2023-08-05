# About

This repo is a guide I created for installing Arch Linux (Or any other distro if you want) from scratch. It includes several scripts for installing the main tools I use on my different machines split into different categories.

- All information is extracted and heavily inspired by the Arch Wiki.
- For tips and tricks on managing and improving your experience on Arch Linux, checkout [this](https://chedlyzouche.me/blog/arch-linux-tweaks) blog post.

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

- pacman -Sy
- timedatectl set-ntp true

# Preparing Partitions

- Create partitions with cfdisk / cgdisk (/dev/device)
- Format partitions vfat and ext4 (EFI At least 300M)

```sh
mkfs.vfat /efi/partition
mkfs.ext4 /root/partition
```

- Mount partitions :

```sh
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

Add `/swapfile none swap defaults 0 0` to the `/etc/fstab`

- Set your timezone :

```sh
ln -sf /usr/share/zoneinfo/Africa/Tunis /etc/localtime
hwclock --systohc
```

- Generate locales :

  - Uncomment `en_US-utf-8` in **/etc/locale.gen** then run

```sh
locale-gen
```

- Clone install-scripts
- Make all script files executable
- Check then run **base.sh**
- Create Root password with `passwd`

## Bootloader

- Edit /etc/default/grub and remove quiet flag. **If Dual booting, append this line to `/etc/default/grub`** : **GRUB_DISABLE_OS_PROBER=false**
- Install Grub (For EFI) :

```sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

- Create grub config :

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

## Add a user

```sh
useradd -mG wheel,audio,video,input zedo
passwd zedo
usermod -c "Chedly" Zedo
```

- Allow wheel group to run commands with sudo by uncommenting `%wheel ALL=(ALL) ALL`

```sh
EDITOR=nvim visudo
```

- umount -a, exit and reboot.

# Post-Reboot

- Connect to your network with nmtui.
- Run `post-reboot.sh`.
- Add `nvidia` and `i915` (Intel) or `amdgpu radeon` (AMD) modules to `/etc/mkinitcpio.conf` if you encounter some problems.
- Enable the [Chaotic AUR](https://aur.chaotic.cx/).

```sh
sudo mkinitcpio -p linux
```
