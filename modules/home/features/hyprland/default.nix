{ pkgs, ... }:
{
  services.hyprlauncher = {
    enable = true;
    settings.finders = {
      default_finder = "desktop";
      desktop_terminal = "${pkgs.kitty}/bin/kitty --";
      desktop_launch_prefix = "${pkgs.uwsm}/bin/uwsm app --";
    };
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source = ./hyprland.lua;
    "hypr/waybar.json".source = ./waybar.json;
    "uwsm/env".text = ''
      export GTK_IM_MODULE=kime
      export QT_IM_MODULE=kime
      export XMODIFIERS=@im=kime
    '';
  };
}
