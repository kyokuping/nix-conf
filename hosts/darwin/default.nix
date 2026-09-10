{ ... }: {
  imports = [
    ./homebrew.nix
    ./secrets.nix
    ./tailscale.nix
    ./system.nix
  ];
}
