{ config, pkgs, ... }:
{
  networking.hostName = "Maki";
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  system.stateVersion = "26.05";
}
