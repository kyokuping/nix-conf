{ lib, pkgs, ... }: {

  programs.home-manager.enable = true;
  imports = [
    ./features/git.nix
    ./features/gpg.nix
    ./features/starship.nix
    ./features/zsh.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    OPENROUTER_API_KEY = "$(cat /run/agenix/openrouter-api-token)";
  };
  home.sessionPath = [
    (if pkgs.stdenv.isDarwin then "$HOME/Library/pnpm/bin" else "$HOME/.local/share/pnpm")
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
        npm.package_manager = "npm";
      };
      tools.node = {
        version = "24";
        postinstall = "npm install -g @openai/codex";
      };
      tools."npm:skills" = "latest";
    };
  };
}
