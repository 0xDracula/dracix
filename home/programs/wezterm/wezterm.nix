{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua" = mkXdgSymlink "wezterm/wezterm.lua" "wezterm.lua";
}
