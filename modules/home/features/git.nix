{ pkgs, ... }: {
  programs.git = {
    settings = {
      user = {
        name = "kyokuping";
        email = "me@kyoku.dev";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "cache";
      color.ui = true;
      core.editor = "vim";
    };
    enable = true;
    signing.format = null;
    lfs.enable = true;
  };
  home.packages = [ pkgs.git-lfs ];
}
