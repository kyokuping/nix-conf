{ pkgs, inputs }: with pkgs; [
  git
  neovim
  lazygit
  gh
  glab
  nil
  nixpkgs-fmt
  delta
  chezmoi
  mise
  htop
  k9s
  fluxcd
  direnv
  nix-direnv
  devpod

  rustup
  zellij
  inputs.herdr.packages.${pkgs.system}.default
]
