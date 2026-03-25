{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      wl-copy = if pkgs.stdenv.isDarwin then "pbcopy" else "wl-copy";
      pbcopy = if pkgs.stdenv.isDarwin then "wl-copy" else "pbcopy";

      v = "vim";
    };
  };

}
