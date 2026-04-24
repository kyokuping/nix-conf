{ self, pkgs, ... }:

let
  cleanup-target = "/Users/kyoku/contributions";

  cleanup-script = pkgs.writeShellApplication {
    name = "cleanup";
    runtimeInputs = [ pkgs.findutils pkgs.git ];
    text = ''
      TARGET_ROOT="${cleanup-target}"
      ${builtins.readFile (self + "/assets/cleanup.sh")}
    '';
  };
in
{
  launchd.user.agents.repo-cleanup = {
    serviceConfig = {
      ProgramArguments = [ "${cleanup-script}/bin/cleanup" ];
      StartCalendarInterval = [{ Hour = 3; Minute = 0; }];
      StandardOutPath = "/tmp/repo-cleanup.log";
      StandardErrorPath = "/tmp/repo-cleanup.err";
    };
  };

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
