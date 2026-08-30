{ config, pkgs, quickshell, ... }:

{
  imports = [
    ../../../../modules/home
    ./packages.nix
    ./programs.nix
    ./hyprland.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      kdePackages.xdg-desktop-portal-kde
    ];
  };

  fonts.fontconfig.enable = true;
}
