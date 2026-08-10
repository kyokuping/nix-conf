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
      "claude-code"
      "codex"
      "codex-app"
    ];

    brews = [
      "hashicorp/tap/terraform"
      "zstd"
    ];

  };
}
