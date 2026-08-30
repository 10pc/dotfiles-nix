{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;
    settings = {};
    extraConfig = "";
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source = .config/hypr/hyprland.lua;

    # "hypr/hyprland/.lua".source = .config/hypr/hyprland/.lua;
    "hypr/hyprland/execs.lua".source = .config/hypr/hyprland/execs.lua;
    "hypr/hyprland/general.lua".source = .config/hypr/hyprland/general.lua;
    "hypr/hyprland/keybinds.lua".source = .config/hypr/hyprland/keybinds.lua;
    "hypr/hyprland/rules.lua".source = .config/hypr/hyprland/rules.lua;
  };
}
