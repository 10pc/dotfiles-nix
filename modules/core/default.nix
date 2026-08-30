{ ... }:
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./audio.nix
    ./system.nix
    ./user.nix
    ./services.nix
    ./wayland.nix
    ./xserver.nix
    ./program.nix
  ];
}
