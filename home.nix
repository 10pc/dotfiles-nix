{ config, pkgs, ... }:

{
    home.username = "kaupec1";
    home.homeDirectory = "/home/kaupec1";

    home.packages = with pkgs; [
        fastfetch
        cowsay
        btop
    ];

    home.stateVersion = "26.05";
}