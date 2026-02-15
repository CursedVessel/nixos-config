{ config, pkgs, ... }:
{
  # imports = [ ./hardware-configuration.nix ];
  networking.hostName = "Itadori";
  system.stateVersion = "26.05";
}
