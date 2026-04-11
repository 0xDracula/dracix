{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    sqlite
  ];

  home.file.".sqliterc" = mkHomeSymlink ".sqliterc" "sqliterc";
}
