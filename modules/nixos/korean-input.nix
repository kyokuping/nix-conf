{ ... }:
{
  nixpkgs.overlays = [ (import ../../overlays/kime.nix) ];
  i18n.inputMethod = {
    enable = true;
    type = "kime";
    kime = {
      daemonModules = [ "Wayland" "Xim" "Indicator" ];
      iconColor = "White";
    };
  };
}
