{ ... }: {

  programs.home-manager.enable = true;
  imports = [
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
      tools.node = "24";
      tools."npm:@earendil-works/pi-coding-agent" = "latest";
    };
  };
}
