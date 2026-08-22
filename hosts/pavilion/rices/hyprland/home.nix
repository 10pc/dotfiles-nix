{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../common.nix
  ];

  home.packages = with pkgs; [
    inputs.quickshell.packages.x86_64-linux.default
  ];

  programs = {
    kitty.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ", preferred, auto, 1";
      input.kb_layout = "us";
      general.gaps_in = 5;
      general.gaps_out = 10;
      decoration.rounding = 10;
      
      bind = [
        "SUPER, T, exec, kitty"
      ];
    };
  };
}
