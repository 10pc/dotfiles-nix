{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
    pkgs.qt6Packages.qt5compat
  ];
}