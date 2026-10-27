{ pkgs, ... }:
{
  imports = [
    ../../modules/home/features/linux-apps.nix
    ../../modules/home/features/kitty.nix
    ../../modules/home/features/hyprland
    ../../modules/home/features/kime.nix
  ];

  home.packages = [ pkgs.wl-clipboard ];
}
