{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      v = "nvim";
      vim = "nvim";
      vi = "nvim";
    } // (if pkgs.stdenv.isDarwin then {
      wl-copy = "pbcopy";
      wl-paste = "pbpaste";
    } else {
      pbcopy = "wl-copy";
      pbpaste = "wl-paste";
    });
  };

}
