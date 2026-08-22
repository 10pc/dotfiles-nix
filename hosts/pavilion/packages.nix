{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tailscale
    devenv
  ];

  programs.zsh.enable = true;
}
