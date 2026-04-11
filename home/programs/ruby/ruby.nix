{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    ruby_3_4
    rubyfmt
  ];

  home.file.".irbrc" = mkHomeSymlink ".irbrc" "irbrc";
  home.file.".default-gems" = lib.mkIf config.dotfiles.programs.mise.enable (
    mkHomeSymlink ".default-gems" "default-gems"
  );
}
