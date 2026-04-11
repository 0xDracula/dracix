{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;

  home.packages = with pkgs; [
    hyprcursor
    hypridle
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    hyprsunset
    pyprland
    waybar
  ];

  xdg.configFile."hypr/hyprland.conf" = mkXdgSymlink "hypr/hyprland.conf" "hyprland.conf";
}
