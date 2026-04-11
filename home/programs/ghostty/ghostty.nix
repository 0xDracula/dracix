{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config" = mkXdgSymlink "ghostty/config" "config";
  xdg.configFile."ghostty/themes/Day" = mkXdgSymlink "ghostty/themes/Day" "themes/Day";
  xdg.configFile."ghostty/themes/Night" = mkXdgSymlink "ghostty/themes/Night" "themes/Night";

  dconf.settings = lib.mkIf config.dotfiles.programs.gnome.enable {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Terminal";
      command = "ghostty";
      binding = "<Super>Return";
    };
  };

}
