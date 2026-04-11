{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    direnv
  ];

  xdg.configFile."direnv/direnvrc" = mkXdgSymlink "direnv/direnvrc" "direnvrc";
}
