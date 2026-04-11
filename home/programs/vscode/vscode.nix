{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    pkgs.unstable.vscode
  ];

  xdg.configFile."Code/User/settings.json" = mkXdgSymlink "Code/User/settings.json" "settings.json";
  xdg.configFile."Code/User/keybindings.json" = mkXdgSymlink "Code/User/keybindings.json" "keybindings.json";
}
