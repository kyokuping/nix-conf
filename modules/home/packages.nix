{ pkgs, inputs }: with pkgs; [
  vim
  git
  glab
  nil
  nixpkgs-fmt
  delta
  chezmoi
  htop
  k9s
  rustup
  zellij
  inputs.herdr.packages.${pkgs.system}.default
]
