{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [ ];

    casks = [
      "alacritty"
      "zed"
      "zen-browser"
      "raycast"
      "cmux"
      "discord"
      "orbstack"
      "codex-app"
    ];

    brews = [
      "zstd"
    ];

  };
}
