# This module contains the basic configuration for building a NixOS
# installation CD.

{ config, lib, pkgs, ... }:

with lib;

{
  imports =
    [ ./channel.nix
      ./iso-image.nix

      # Profiles of this basic installation CD.
      ../../profiles/all-hardware.nix
      ../../profiles/base.nix
      ../../profiles/installation-device.nix
    ];

  # ISO naming.
  isoImage.isoName = "${config.isoImage.isoBaseName}-${config.system.nixosVersion}-${pkgs.stdenv.system}.iso";

  isoImage.volumeID = substring 0 11 "NIXOS_ISO";

  # Make the installer more likely to succeed in low memory
  # environments.  The kernel's overcommit heustistics bite us
  # fairly often, preventing processes such as nix-worker or
  # download-using-manifests.pl from forking even if there is
  # plenty of free memory.
  boot.kernel.sysctl."vm.overcommit_memory" = "1";

  # To speed up installation a little bit, include the complete stdenv
  # in the Nix store on the CD.  Archive::Cpio is needed for the
  # initrd builder.
  isoImage.storeContents = [ pkgs.stdenv pkgs.busybox pkgs.perlPackages.ArchiveCpio ];

  # EFI booting
  isoImage.makeEfiBootable = true;

  # USB booting
  isoImage.makeUsbBootable = true;

  # Add Memtest86+ to the CD.
  boot.loader.grub.memtest86.enable = true;

  # Get a console as soon as the initrd loads fbcon on EFI boot.
  boot.initrd.kernelModules = [ "fbcon" ];

  # Add support for cow filesystems and their utilities
  boot.supportedFilesystems = [ "zfs" "btrfs" ];

  # Allow the user to log in as root without a password.
  users.extraUsers.root.initialHashedPassword = "";
}
