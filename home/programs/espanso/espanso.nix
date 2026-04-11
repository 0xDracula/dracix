{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    espanso-wayland
  ];

  xdg.configFile."espanso/config" = mkXdgSymlink "espanso/config" "config";
  xdg.configFile."espanso/match" = mkXdgSymlink "espanso/match" "match";
}
