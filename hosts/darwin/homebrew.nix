{ ... }: {
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
      "can1357/tap"
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
    ];

    brews = [
      "can1357/tap/omp"
      "zstd"
    ];

  };
}
