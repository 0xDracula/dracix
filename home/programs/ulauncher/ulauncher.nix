{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    ulauncher
  ];

  xdg.configFile."autostart/ulauncher.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Exec=${pkgs.ulauncher}/bin/ulauncher --hide-window
    Restart=always
    Hidden=false
    X-GNOME-Autostart-enabled=true
    Name=ULauncher
    Comment=Keyboard launcher
  '';

  xdg.configFile."ulauncher/settings.json" = mkXdgSymlink "ulauncher/settings.json" "settings.json";
  xdg.configFile."ulauncher/extensions.json" = mkXdgSymlink "ulauncher/extensions.json" "extensions.json";
  xdg.configFile."ulauncher/shortcuts.json" = mkXdgSymlink "ulauncher/shortcuts.json" "shortcuts.json";

  xdg.configFile."ulauncher/user-themes" = mkXdgSymlink "ulauncher/user-themes" "themes";

  dconf.settings = lib.mkIf config.dotfiles.programs.gnome.enable {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "ULauncher";
      command = "ulauncher-toggle";
      binding = "<Alt>Space";
    };
  };
}
