# Tips and tricks

## List of common fixes

- [Tapping on Xorg for laptops](#tapping-on-xorg-for-laptops)
- [Java applications (DWM)](#java-applications-on-dwm)
- [Switch default POSIX shell interpreter to Dash instead of Bash](#switch-default-posix-shell-interpreter-to-dash-instead-of-bash)
- [Wayland](#wayland)
- [Soft and hard blocked Wifi Cards](#soft-and-hard-blocked-wifi-cards)
- [Using internal mic while headhphones are plugged](#using-internal-mic-while-headhphones-are-plugged)
- [Fix backlight issues on laptops with AMD Ryzen CPUs](#fix-backlight-issues-on-laptops-with-amd-ryzen-cpus)
- [Lenovo Ideapad 5 tricks](#lenovo-ideapad-5-tricks)
- [Disabling internal speaker](#disabling-internal-speaker)

## Tapping on Xorg for laptops

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

## Java applications on DWM

**[Source](https://wiki.archlinux.org/title/Dwm#Fixing_misbehaving_Java_applications)**

- Append `export _JAVA_AWT_WM_NONREPARENTING=1` to `/etc/profile.d/jre.sh`
- Append `export AWT_TOOLKIT=MToolkit` and `export _JAVA_AWT_WM_NONREPARENTING=1` to window manager start script (.xinitrc...)

## Switch default POSIX shell interpreter to Dash instead of Bash

- In order to improve portability and performance when executing POSIX compliant shell scripts, Download `dash` and link it symbolically to /usr/bin/sh. More information on this topic in the [Arch Wiki](https://wiki.archlinux.org/title/Dash).

```
# ln -sfT dash /usr/bin/sh
```

## Wayland

- Wayland is the next generation Display Protocol for Linux.The Linux ecosystem's transition to Wayland has been marching steadily forward through the years.

- There are some major applications that don't (or won't or can't) support Wayland. Programs like this can still be run in a Wayland environment through an isolated X instance called XWayland. This means that the transition to Wayland can be gradual: you won't lose access to older programs that you still need.

- To run Electron or Chromium based browsers in Wayland **(Discord hasn't yet switched to electron 12 to support Wayland)**, add the following flags :

```bash
brave/code --enable-features=UseOzonePlatform --ozone-platform=wayland
```

- Check which apps running on XWayland :

```bash
xlsclients
```

- To enable screen sharting features, make sure you have `xdg-desktop-portal-wlr` and `libpipewire02` installed. When prompted for which screen, choose **Use operating system settings**. You cursor will change to indicate that you can choose the screen to share.

- More tips and info on Wayland in this [article](https://www.fosskers.ca/en/blog/wayland#orgcf32d8) and this [website](https://arewewaylandyet.com/).

## Soft and hard blocked Wifi Cards

- Many laptops have a hardware button (or switch) to turn off wireless card (Hard), however, the card can also be blocked by kernel(Soft). This can be handled by rfkill.

```sh
# Show current status
rfkill list
# Unblock soft blocked
rfkill unblock all
```

## Using internal mic while headhphones are plugged

- Install the `alsa-tools` package (`alsa-tools-gui` for debian based distros).
- Run `hdajackretask`.
- Select the appropriate sound card up top in **Select a codec**.
- Make the Black Mic (headphone jack) **Override - Not connected**.
- In the lower right corner, select **Install boot override**.
- Reboot and test.
- This fix is extracted from [here](https://askubuntu.com/questions/1218136/internal-microphone-doesnt-work-when-using-headphones).

## Fix backlight issues on laptops with AMD Ryzen CPUs

- Many new laptops with the Ryzen CPUs might have some problems for adjusting the screen brightness.
- Kernels 5.11.7, 5.12-rc3, and later allow the kernel parameter `amdgpu.backlight=0` to be passed at boot to fix this issue for Lenovo IdeaPad Gaming 3 (in my case), and possibly other laptops with similar specs.

- Edit your grub default config under `/etc/default/grub` as shown below (You can keep your old kernel parameters).

```
GRUB_CMDLINE_LINUX="amdgpu.backlight=0"
```

- Make sure to remake your grub config with `grub-mkconfig -o /boot/grub/grub.cfg` or `update-grub` on debian based distros.

- After running update-grub and rebooting the backlight controls should work.

Previous kernels required patching: The workaround can be found in this [GitLab issue](https://gitlab.freedesktop.org/drm/amd/-/issues/1438). Forcing `caps->aux_support = false;` in `drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c` fixed the [issue](https://bugzilla.opensuse.org/show_bug.cgi?id=1180749).

## Lenovo Ideapad 5 tricks

These tips should apply to Ideapad Gaming 3 too, icluding [battery conservation mode](https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05#Battery_Conservation), [system performance mode](https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05#System_Performance_Mode) and [rapid charge](https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05#Rapid_Charge).

- Note that if you are dual booting with Windows, changing some settings on Linux will override your settings on Windows.

## Disabling internal speaker

You can find out that your laptop has an internal speaker if it emits some beeps on specific actions. This can be annoying especially if you're working in a public space. To disable these speakers, there are 3 methods as specified in the [Arch Wiki](https://wiki.archlinux.org/title/PC_speaker#Globally):

1. Disabling it by unloading the speaker kernel module (As root) with :

```sh
rmmod pcspkr
```

2. Blacklisting the module by creating a file under `/etc/modprobe.d/nobeep.conf` and adding the following line :

```
blacklist pcspkr
```

3. Blacklisting the module on the kernel commandline. Just add this line to your bootloader's kernel line:

```
modprobe.blacklist=pcspkr
```
