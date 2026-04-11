{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    restic
  ];

  xdg.configFile."restic/exclude.txt" = mkXdgSymlink "restic/exclude.txt" "exclude.txt";
}
