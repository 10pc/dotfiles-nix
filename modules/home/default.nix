{ ... }:
{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
  ];

  home.username = "kaupec1";
  home.homeDirectory = "/home/kaupec1";
  home.stateVersion = "26.05";
}
