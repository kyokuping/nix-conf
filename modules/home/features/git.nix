{ pkgs, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing.format = null;

    settings = {
      user = {
        name = "kyokuping";
        email = "me@kyoku.dev";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      branch = {
        sort = "-committerdate";
      };
      credential = {
        helper = "cache";
      };
      color = {
        ui = true;
      };
      core = {
        editor = "vim";
      };
      alias = {
        git = "!exec git";
      };
    };
  };

  home.packages = [ pkgs.git-lfs ];
}
