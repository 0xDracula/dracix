{ config, lib, ... }:

{
  # Create true symlinks to files in the dotfiles repository.
  lib.dotfiles = {
    mkSymlinkAbsolute =
      absolutePath:
      {
        source = config.lib.file.mkOutOfStoreSymlink absolutePath;
        onChange = ''
          RED="\033[1;31m"
          YELLOW="\033[1;33m"
          RESET="\033[0m"

          if [ ! -e "${absolutePath}" ]; then
            echo -e "$YELLOW⚠ Warning$RESET: '${absolutePath}' does not exist $RED✗$RESET" >&2
          fi
        '';
      };

    mkSymlinkFrom =
      dotfilesPath: relativePath:
      let
        targetPath = "${dotfilesPath}/${relativePath}";
      in
      {
        source = config.lib.file.mkOutOfStoreSymlink targetPath;
        onChange = ''
          RED="\033[1;31m"
          YELLOW="\033[1;33m"
          RESET="\033[0m"

          if [ ! -e "${targetPath}" ]; then
            echo -e "$YELLOW⚠ Warning$RESET: '${targetPath}' does not exist $RED✗$RESET" >&2
          fi
        '';
      };

    mkPreferProfilePath =
      relativeHomePath: fallback:
      let
        base = "${config.home.homeDirectory}/.dotfiles/home";
        profilePaths =
          map (p: "${base}/profiles/${p}/${relativeHomePath}") (config.dotfiles.profiles.enabled or [ ]);

        # `builtins.pathExists` must be given a Nix *path*, not just a string.
        # Convert absolute string paths into Nix paths rooted at / for existence checks.
        exists = s: builtins.pathExists (/. + (lib.removePrefix "/" s));
        chosen = lib.findFirst exists null profilePaths;
      in
      if chosen == null then
        fallback
      else
        config.lib.dotfiles.mkSymlinkAbsolute chosen;
  };
}
