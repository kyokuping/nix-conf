{ self, pkgs, username, ... }:

let
  cleanup-target = "/Users/${username}/contributions";

  cleanup-script = pkgs.writeShellApplication {
    name = "cleanup";
    runtimeInputs = [ pkgs.findutils pkgs.git ];
    text = ''
      TARGET_ROOT="${cleanup-target}"
      ${builtins.readFile (self + "/assets/cleanup.sh")}
    '';
  };

  opencode-serve = pkgs.writeShellApplication {
    name = "opencode-serve";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      OPENCODE_SERVER_PASSWORD="$(cat /run/agenix/opencode-server-password)"
      export OPENCODE_SERVER_PASSWORD
      exec /opt/homebrew/bin/opencode serve --hostname 127.0.0.1 --port 4096
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

  # Shared OpenCode server for T3 Code, listening on 127.0.0.1:4096.
  launchd.user.agents.opencode-serve = {
    serviceConfig = {
      ProgramArguments = [ "${opencode-serve}/bin/opencode-serve" ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/tmp/opencode-serve.log";
      StandardErrorPath = "/tmp/opencode-serve.err";
    };
  };

  system.configurationRevision = self.rev or null;
  system.stateVersion = 6;
  system.primaryUser = username;
  users.users.${username}.home = "/Users/${username}";
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

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "zed" ''
      exec /Applications/Zed.app/Contents/MacOS/cli "$@"
    '')
  ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

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
