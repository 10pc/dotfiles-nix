{ pkgs, inputs, quickshell, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    settings = {
      background_opacity = "0.85";
      confirm_os_window_close = "-1";
      enable_audio_bell = "no";
      scrollback_lines = 10000;
    };
  };

  programs.quickshell = {
    enable = true;
    package = pkgs.callPackage ./quickshell.nix { inherit quickshell; };
    configs = {
      default = .config/quickshell;
    };
    activeConfig = "default";
  };

  programs.spicetify = 
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
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        pointer
      ];
    };
}