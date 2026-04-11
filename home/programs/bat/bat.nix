{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    bat
  ];

  xdg.configFile."bat/config" = mkXdgSymlink "bat/config" "config";

  programs.zsh.envExtra = lib.mkIf config.dotfiles.programs.zsh.enable ''
    get_bat_theme() {
      if [[ "$(mode --theme)" =~ "light" ]]; then
        echo -n "GitHub"
      else
        echo -n "default"
      fi
    }

    alias cat='bat -p --theme=$(get_bat_theme)'
  '';
}
