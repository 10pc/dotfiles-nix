{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./packages.nix
    ./users.nix
  ];

  system.stateVersion = "26.05";
}
