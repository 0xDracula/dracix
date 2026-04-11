{
  config,
  lib,
  pkgs,
  mkHomeSymlink,
  ...
}:
{
  # ── Packages ──────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    claude-code
  ];

  # ── Symlinked Config Files ───────────────────────────────────────────
  home.file.".claude/skills" = mkHomeSymlink ".claude/skills" "skills";
}
