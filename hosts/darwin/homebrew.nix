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
    ];

    masApps = {
      "tailscale" = 1475387142;
    };
  };
}
