{ ... }: {

  programs.home-manager.enable = true;
  imports = [
    ./features/gh.nix
    ./features/git.nix
    ./features/starship.nix
    ./features/zsh.nix
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;

    config = {
      global = {
        hide_env_diff = true;
      };
    };
  };
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      settings = {
        experimental = true;
      };
    };
  };
}
