{
  nixpkgs,
  home-manager,
  plasma-manager,
}:
system: hostname: username: cfg:
let
  lib = nixpkgs.lib;
  mkHomeModule = import ../home/lib/mkHomeModule.nix { inherit lib; };
  mkHomeProfile = import ../home/lib/mkHomeProfile.nix { inherit lib; };
  homeModules = map (name: mkHomeModule name (import ../home/programs/${name}/${name}.nix)) (
    lib.attrNames (builtins.readDir ../home/programs)
  );

  profileDirs = builtins.readDir ../home/profiles;
  profileNames = lib.filter (n: (profileDirs.${n} or null) == "directory") (lib.attrNames profileDirs);
  homeProfiles = map (name: mkHomeProfile name (import ../home/profiles/${name}/default.nix)) profileNames;
in
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit username hostname;
  }
  // (cfg.extraSpecialArgs or { });
  modules = [
    { nixpkgs.overlays = cfg.overlays or [ ]; }
    plasma-manager.homeManagerModules.plasma-manager
    ../home
    ../home/lib
    ../home/profiles
  ]
  ++ homeProfiles
  ++ homeModules;
}
