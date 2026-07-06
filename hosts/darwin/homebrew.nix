{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
      "hashicorp/tap"
    ];

    casks = [
      "alacritty"
      "zed"
      "zen-browser"
      "raycast"
      "cmux"
      "discord"
      "orbstack"
      "tailscale"
      "codex-app"
    ];

    brews = [
      "hashicorp/tap/terraform"
      "zstd"
    ];

    masApps = {
      "tailscale" = 1475387142;
    };
  };
}
