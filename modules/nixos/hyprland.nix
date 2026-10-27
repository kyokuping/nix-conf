{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "kr";
    options = "korean:ralt_hangul";
  };
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  security.polkit.enable = true;
  systemd.packages = [ pkgs.hyprpolkitagent ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  environment.systemPackages = with pkgs; [
    kitty waybar mako networkmanagerapplet
    hyprpolkitagent brightnessctl playerctl
  ];
}
