This is our ArchLinux install helper scripts.
It contains scripts for post chroot install.

This readme contains memory joggers for the pre-chroot steps:

1. Make sure you are running in EFI mode.
2. Connect to internet. iwctl moment 😔.
3. Partition, boot partition and cryptroot partition. Turn cryptroot into btrfs via mkfs.btrfs /dev/mapper/cryptroot
4. Mount /dev/mapper/cryptroot /mnt
5. Create btrfs subvolumes. (Make a subvolume for swap if needed.)
6. Umount /mnt.
7. Mount btrfs subvolumes use noatime, zstd, and discard=async if it's an ssd drive.
8. Add swap if needed.
9. pacstrap -K /mnt base linux-zen linux-firmware nano git base-devel
10. Genfstab
11. arch-chroot /mnt

A bunch of this is stolen shamelessly from johnynfulleffect/ArchMatic