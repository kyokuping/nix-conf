{ ... }: {
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
      "can1357/tap"
      "anomalyco/tap"
    ];

    casks = [
      "alacritty"
      "zed"
      "zen"
      "raycast"
      "discord"
      "bitwarden"
      "orbstack"
      "dbeaver-community"
      "yaak"
      "claude-code"
      "codex"
      "codex-app"
      "t3-code"
    ];

    brews = [
      "can1357/tap/omp"
      "zstd"
      "anomalyco/tap/opencode-v2"
    ];

  };
}
