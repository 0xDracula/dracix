{ lib, ... }:
name: body:
{ config, ... }@args:
{
  options.dotfiles.profiles.${name}.enable = lib.mkEnableOption "Enable ${name} profile.";

  config = lib.mkIf config.dotfiles.profiles.${name}.enable (
    lib.mkMerge [
      { dotfiles.profiles.enabled = lib.mkAfter [ name ]; }
      (body args)
    ]
  );
}
