{
  config,
  lib,
  pkgs,
  hostname,
  ...
}:
let
  enableFor = hosts: lib.elem hostname hosts;
  disableFor = hosts: !lib.elem hostname hosts;
in
{
  # Desktop Environment
  dotfiles.programs.plasma.enable = enableFor [ "loq" ];
  dotfiles.programs.hyprland.enable = false;

  # Shells
  dotfiles.programs.zsh.enable = true;

  # Terminals
  dotfiles.programs.ghostty.enable = true;
  dotfiles.programs.wezterm.enable = disableFor [ "thinkpad" ];

  # Editors & IDEs
  dotfiles.programs.fonts.enable = true;
  dotfiles.programs.jetbrains.enable = enableFor [ "loq" ];
  dotfiles.programs.nvim.enable = true;
  dotfiles.programs.vscode.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.zed.enable = disableFor [ "thinkpad" ];

  # Programming Languages
  dotfiles.programs.elixir.enable = true;
  dotfiles.programs.erlang.enable = true;
  dotfiles.programs.flutter.enable = true;
  dotfiles.programs.golang.enable = true;
  dotfiles.programs.haskell.enable = true;
  dotfiles.programs.nodejs.enable = true;
  dotfiles.programs.python.enable = true;
  dotfiles.programs.ruby.enable = true;

  # Dev Tools
  dotfiles.programs.bat.enable = true;
  dotfiles.programs.bruno.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.claude.enable = true;
  dotfiles.programs.codex.enable = true;
  dotfiles.programs.direnv.enable = true;
  dotfiles.programs.fzf.enable = true;
  dotfiles.programs.git.enable = true;
  dotfiles.programs.httpie.enable = true;
  dotfiles.programs.hyperfine.enable = true;
  dotfiles.programs.jj.enable = true;
  dotfiles.programs.jq.enable = true;
  dotfiles.programs.mise.enable = true;
  dotfiles.programs.mysql.enable = false;
  dotfiles.programs.podman.enable = true;
  dotfiles.programs.rclone.enable = true;
  dotfiles.programs.restic.enable = false;
  dotfiles.programs.sqlite.enable = true;
  dotfiles.programs.ssh.enable = true;
  dotfiles.programs.terraform.enable = true;
  dotfiles.programs.watchman.enable = true;
  dotfiles.programs.zoxide.enable = true;

  # Typesetting
  dotfiles.programs.latex.enable = true;
  dotfiles.programs.typst.enable = true;

  # Desktop Applications
  dotfiles.programs.beeper.enable = enableFor [ "loq" ];
  dotfiles.programs.bitwarden.enable = enableFor [ "loq" ];
  dotfiles.programs.calibre.enable = enableFor [ "loq" ];
  dotfiles.programs.chrome.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.digikam.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.espanso.enable = false;
  dotfiles.programs.gimp.enable = enableFor [ "loq" ];
  dotfiles.programs.inkscape.enable = enableFor [ "loq" ];
  dotfiles.programs.libreoffice.enable = enableFor [ "loq" ];
  dotfiles.programs.localsend.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.obsidian.enable = enableFor [ "loq" ];
  dotfiles.programs.pinta.enable = enableFor [ "loq" ];
  dotfiles.programs.wine.enable = enableFor [ "loq" ];
  dotfiles.programs.zeal.enable = disableFor [ "thinkpad" ];
  dotfiles.programs.zen.enable = disableFor [ "thinkpad" ];

  dotfiles.packages.enable = true;
}
