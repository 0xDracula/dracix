{ lib, ... }:
{
  options.dotfiles.profiles = {
    enabled = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Enabled dotfiles profiles (Home Manager).";
    };
  };
}
