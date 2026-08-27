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
      "zen"
      "raycast"
      "discord"
      "orbstack"
      "dbeaver-community"
      "yaak"
      "claude-code"
      "codex"
      "codex-app"
    ];

    brews = [
      {
        name = "hashicorp/tap/terraform";
        trusted = true;
      }
      "zstd"
    ];

  };
}
