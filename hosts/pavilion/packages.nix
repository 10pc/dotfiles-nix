{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    tailscale
    devenv
  ];

  programs.zsh.enable = true;
}
