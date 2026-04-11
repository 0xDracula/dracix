{
  config,
  lib,
  pkgs,
  mkXdgSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    # erlang_27
  ];

  home.sessionVariables = {
    KERL_BUILD_DOCS = "yes";
    KERL_INSTALL_HTMLDOCS = "yes";
    KERL_INSTALL_MANPAGES = "yes";
  };

  xdg.configFile."rebar/rebar.config" = mkXdgSymlink "rebar/rebar.config" "rebar.config";
}
