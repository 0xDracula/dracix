{
  config,
  lib,
  pkgs,
  mkSymlink,
  ...
}:
{
  # ── Packages ──────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    kdePackages.plasma-browser-integration
    kdePackages.kde-gtk-config
  ];
  programs.plasma = {
    enable = true;
    #shortcuts = {
      #"services/org.flameshot.Flameshot.desktop" = {
        #"Capture" = "Meta+Shift+S";
      #};
    #};

    input = {
      touchpads = [
        {
          enable = true;
          vendorId = "04f3";
          productId = "327e";
          name = "ELAN06FA:00 04F3:327E Touchpad";
          naturalScroll = true;
        }
      ];
      keyboard = {
        numlockOnStartup = "on";
        options = [ "grp:win_space_toggle" ];
        layouts = [
          {
            layout = "us";
          }
          {
            layout = "ara";
          }
        ];
      };
    };
  };
  # ── Environment Variables ─────────────────────────────────────────────
  # home.sessionVariables = {
  #   EXAMPLE_VAR = "value";
  #   EDITOR = "${pkgs.plasma}/bin/plasma";
  # };

  # ── Shell Integration (zsh) ──────────────────────────────────────────
  # programs.zsh.envExtra = lib.mkIf config.dotfiles.programs.zsh.enable ''
  #   # source extra shell config, completions, etc.
  #   # eval $(${pkgs.plasma}/bin/plasma init zsh)
  # '';

  # ── Symlinked Config Files ───────────────────────────────────────────
  # home.file.".config/plasma" = mkSymlink "config";
  # xdg.configFile."plasma/config" = mkSymlink "config";
  # xdg.configFile."plasma/config.toml" = mkSymlink "config.toml";

  # ── Fetch from GitHub ────────────────────────────────────────────────
  # home.file.".plasma/plugins/example-plugin" = {
  #   source = pkgs.fetchFromGitHub {
  #     owner = "owner";
  #     repo = "repo";
  #     rev = "v1.0.0";
  #     sha256 = "";
  #   };
  # };

  # ── GNOME / dconf Integration ────────────────────────────────────────
  # dconf.settings = lib.mkIf config.dotfiles.programs.gnome.enable {
  #   "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
  #     name = "Plasma";
  #     command = "plasma";
  #     binding = "<Super>F1";
  #   };
  # };
}
