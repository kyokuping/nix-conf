{ self, ... }: {

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
  system.primaryUser = "kyoku";
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {

    dock = {
      autohide = true;
      show-recents = false;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
      FXPreferredViewStyle = "clmv";
    };
  };

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "zed --wait";
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    max-jobs = "auto";
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 0; Minute = 0; };
    options = "--delete-older-than 30d";
  };
}
