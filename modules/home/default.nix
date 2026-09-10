{ pkgs, ... }: {

  programs.home-manager.enable = true;
  imports = [
    ./features/git.nix
    ./features/starship.nix
    ./features/zsh.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  home.sessionPath = [ "$HOME/Library/pnpm/bin" ];
  # neovim + lazygit come from packages.nix; their config is managed by chezmoi
  # (~/.local/share/chezmoi -> ~/.config/nvim, ~/.config/lazygit).

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
        npm.package_manager = "npm";
      };
      tools.node = {
        version = "24";
        postinstall = "npm install -g @openai/codex";
      };
      tools."npm:@anthropic-ai/claude-code" = {
        version = "latest";
        npm_args = "--include=optional --ignore-scripts=false";
      };
      tools."npm:@earendil-works/pi-coding-agent" = "latest";
    };
  };
}
