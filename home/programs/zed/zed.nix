{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/settings.json" = mkXdgSymlink "zed/settings.json" "./settings.json";
}
