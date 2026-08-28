{
  config,
  pkgs,
  lib,
  inputs,
  quickshell,
  ...
}:

{
  imports = [
    ../../../../modules/home
  ];

  home.packages = with pkgs; [
    rofi
    quickshell
  ];

  programs = {
    kitty.enable = true;

    quickshell = {
      enable = true;
      package = quickshell;
      configs = {
        default = ./quickshell;
      };
      activeConfig = "default";
    };

    spicetify =
      let
        spicePkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      in
      {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          adblock
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
        enabledCustomApps = with spicePkgs.apps; [
          newReleases
          ncsVisualizer
        ];
        enabledSnippets = with spicePkgs.snippets; [
          rotatingCoverart
          pointer
        ];

        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraLuaFiles = {
      "binds" = {
        content = ./lua/binds.lua;
        autoLoad = true;
      };
      "settings" = {
        content = ./lua/settings.lua;
        autoLoad = true;
      };
      "looks" = {
        content = ./lua/looks.lua;
        autoLoad = true;
      };
      "exec-once" = {
        content = ./lua/exec-once.lua;
        autoLoad = true;
      };
    };
  };
}
