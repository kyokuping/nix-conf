{ pkgs, inputs }: with pkgs; [
  jp
  git
  neovim
  lazygit
  glab
  nil
  nixpkgs-fmt
  delta
  chezmoi
  htop
  k9s
  kubectl
  rustup
  zellij
  inputs.herdr.packages.${pkgs.system}.default
]
