This is our ArchLinux install helper scripts.
It contains scripts for post chroot install.

This readme contains memory joggers for the pre-chroot steps:

1. Make sure you are running in EFI mode.
2. Connect to internet. iwctl moment 😔.
3. Partition, boot partition and cryptroot partition. Turn cryptroot into btrfs via mkfs.btrfs /dev/mapper/cryptroot
4. Mount /dev/mapper/cryptroot /mnt
5. Create btrfs subvolumes. (Make a subvolume for swap if needed.)
6. Umount /mnt.
7. Mount btrfs subvolumes use noatime, zstd, (and discard=async if it's an ssd drive.)
8. swapon if needed.
9. pacstrap /mnt base linux linux-firmware nano git base-devel networkmanager
10. Genfstab
11. arch-chroot /mnt
12. run 1-base, and 2-software
13. set password using 'passwd'
14. set mkinitcpio hooks for btrfs and encryption if needed. ('btrfs' goes in modules) ('encrypt' goes in hooks). Then 'mkinitcpio -P'
15. install bootloader
16. reboot and login as root, then run 3-security, 4-setup

A bunch of this is stolen shamelessly from johnynfulleffect/ArchMatic
