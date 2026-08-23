{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../../../../modules/home
  ];

  home.packages = with pkgs; [
    inputs.quickshell.packages.x86_64-linux.default
  ];

  programs = {
    kitty.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
  };
}
