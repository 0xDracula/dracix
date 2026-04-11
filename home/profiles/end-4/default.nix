{ lib, ... }:
{
  dotfiles.programs.hyprland.enable = true;
  dotfiles.programs.quickshell.enable = true;

  # home.pkgs = with pkgs; [
  #   kdePackages.bluedevil
  #   gnome-keyring
  #   networkmanager
  #   kdePackages.plasma-nm
  #   kdePackages.polkit-kde-agent-1
  #   kdePackages.dolphin
  #   kdePackages.systemsettings

  #   cava
  #   lxqt.pavucontrol-qt
  #   wireplumber
  #   pipewire
  #   libdbusmenu-gtk3
  #   playerctl

  #   geoclue2
  #   brightnessctl
  #   ddcutil


  #   bc
  #   coreutils
  #   cliphist
  #   cmake
  #   curl
  #   wget
  #   ripgrep
  #   jq
  #   xdg-user-dirs

  #   bibata-cursors
  #   adw-gtk3
  #   matugen
  #   kitty
  #   twemoji-color-font
    
  #   hyprsunset
  #   wl-clipboard

  #   xdg-desktop-portal
  #   xdg-desktop-portal-kde
  #   xdg-desktop-portal-gtk
  #   xdg-desktop-portal-hyprland

  #   clang
  #   uv
  #   gtk4
  #   libadwaita
  #   libsoup3
  #   libportal-gtk4
  #   gobject-introspection
  
  #   hyprshot
  #   slurp
  #   swappy
  #   tesseract
  #   tesseract-data-eng
  #   wf-recorder
  
  #   upower
  #   wtype
  #   ydotool
  
  #   fuzzel
  #   glib2
  #   imagemagick
  #   hypridle
  #   hyprlock
  #   hyprpicker
  #   songrec
  #   translate-shell
  #   wlogout
  #   libqalculate
  # ];
}
