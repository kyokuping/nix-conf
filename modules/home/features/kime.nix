{ lib, pkgs, ... }:
let
  frontend = name: {
    Unit = {
      Description = "Kime ${name} frontend";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session-pre.target" ];
    };
    Service = {
      ExecStart = "${pkgs.kime}/bin/kime-${name}";
      Restart = "on-failure";
      RestartSec = 2;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
in
{
  systemd.user.services = lib.genAttrs [ "kime-wayland" "kime-xim" "kime-indicator" ]
    (name: frontend (lib.removePrefix "kime-" name));

  xdg.configFile."autostart/kime.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=kime daemon
    Hidden=true
  '';
}
