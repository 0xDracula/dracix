{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    jujutsu
  ];

  xdg.configFile."jj/config.toml" = mkXdgSymlink "jj/config.toml" "config.toml";
}
