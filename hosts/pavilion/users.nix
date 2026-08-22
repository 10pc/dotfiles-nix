{ config, pkgs, ... }:

{
  users.users."kaupec1" = {
    isNormalUser = true;
    description = "k";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  users.defaultUserShell = pkgs.zsh;
}
