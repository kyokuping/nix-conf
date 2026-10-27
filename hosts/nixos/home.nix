{ pkgs, ... }:
{
  imports = [
    ../../modules/home/features/kitty.nix
    ../../modules/home/features/hyprland
    ../../modules/home/features/kime.nix
  ];

  home.packages = [ pkgs.wl-clipboard ];
}
