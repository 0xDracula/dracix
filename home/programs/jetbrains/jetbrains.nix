{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
  ];

  home.file.".ideavimrc" = mkHomeSymlink ".ideavimrc" "ideavimrc";
}
