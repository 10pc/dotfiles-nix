{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    tailscale
    devenv
    anydesk
  ];

  programs.zsh.enable = true;
}
