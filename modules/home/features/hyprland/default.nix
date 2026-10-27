{ ... }:
{
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
