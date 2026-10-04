{ ... }: {
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
      "can1357/tap"
      "hashicorp/tap"
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
      "paseo"
    ];

    brews = [
      {
        name = "hashicorp/tap/terraform";
        trusted = true;
      }
      "can1357/tap/omp"
      "zstd"
    ];

  };
}
