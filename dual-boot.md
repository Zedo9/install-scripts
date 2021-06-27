# Before doing anything

- Make sure secure-boot is disabled
- Install Windows 10
- Disable Fast Startup in Windows and reboot
- Shrink space from the main partition (50GB to 200GB depending on your use case for linux).
- Install your linux distribution on the free space.
- **It is recommonded to create a seperate EFI partition (For UEFI users) and installing grub there instead of the Windows EFI partition. This will avoid any problems when installing Windows updates.**

# Accessing Linux files from Windows and vice-versa

- To access Linux files from Windows, you can use this [tool](https://www.diskinternals.com/linux-reader/).
- To access Windows files from Linux, make sure you have `ntfs-3g` installed and that your Windows partition is mounted somewhere.
- To improve portability and ease of access, Keep all your main files on the Windows partition.

# Deleting your Linux distribution

- Boot into Windows.
- Delete the root partition of your Linux distribution from the Disk Management tool.
- Run powershell with admin priveleges :

```powershell
diskpart
list volumes
sel vol "arch_efi_partition_nbr"
delete volume override
exit
```

- Close powershell.
- Extend volume back with Windows.
- Reboot.
