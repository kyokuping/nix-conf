{ lib, pkgs, ... }:
{
  # Linux equivalents of hosts/darwin/homebrew.nix. Packages without an LTS
  # channel use stable releases, pinned by flake.lock or a release checksum.
  home.packages = with pkgs; [
    alacritty
    zed-editor
    discord
    bitwarden-desktop
    dbeaver-bin
    yaak
    codex
    opencode
    zstd
    (callPackage ../../../packages/zen-browser.nix { })
    (callPackage ../../../packages/t3-code.nix { })
    (callPackage ../../../packages/omp.nix { })
  ];

  # Codex CLI is supplied by Nix on Linux; avoid a second npm installation.
  programs.mise.globalConfig.tools.node = lib.mkForce { version = "24"; };
}
