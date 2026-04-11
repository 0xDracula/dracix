{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    texliveFull
  ];

  home.file.".latexmkrc" = mkHomeSymlink ".latexmkrc" "latexmkrc";
}
