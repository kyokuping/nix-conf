{ ... }: {
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      editor = "vim";
      prompt = "enabled";
    };
  };
}
