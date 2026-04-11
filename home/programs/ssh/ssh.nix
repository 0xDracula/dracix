{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    openssh
  ];

  home.file.".ssh/config" = mkHomeSymlink ".ssh/config" "config";
}
