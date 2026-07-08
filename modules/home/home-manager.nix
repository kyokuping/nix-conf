{ pkgs, inputs, username, platform, hostname, lib, ... }: {
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs username platform hostname; };
    backupFileExtension = "backup";

    users.${username} = {
      imports = [ ./default.nix ];

      home.stateVersion = "23.11";
      home.username = username;
      home.homeDirectory = lib.mkForce "/Users/${username}";
      home.packages = import ./packages.nix { inherit pkgs inputs; };
    };
  };

}
