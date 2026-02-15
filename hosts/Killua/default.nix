{ config, pkgs, ... }:
{
  networking.hostName = "Killua";
  services.openssh.enable = true;
  system.stateVersion = "26.05";
}
