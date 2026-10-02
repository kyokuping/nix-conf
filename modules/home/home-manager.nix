{ pkgs, inputs, username, platform, hostname, ... }: {
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs username platform hostname; };
    backupFileExtension = "backup";

    users.${username} = {
      imports = [ ./default.nix ];

      home.stateVersion = "23.11";
      home.packages = import ./packages.nix { inherit pkgs inputs; };
    };
  };

}
