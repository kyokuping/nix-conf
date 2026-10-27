{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      linux_display_server = "wayland";
      wayland_enable_ime = true;
    };
  };
}
