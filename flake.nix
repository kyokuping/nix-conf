{
  description = "kyokuping's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    herdr.url = "github:ogulcancelik/herdr/v0.9.0";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs@{ self, agenix, flake-parts, nix-darwin, home-manager, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];

      flake =
        let
          hosts = {
            nixos = {
              platform = "linux";
              system = "x86_64-linux";
              username = "kyoku";
              modules = [ ./hosts/nixos ];
            };
            "kyoku-MacBookAir" = {
              platform = "darwin";
              system = "aarch64-darwin";
              username = "kyoku";
              modules = [ ./hosts/darwin ];
            };
          };

          mkArgs = name: cfg: {
            inherit inputs;
            inherit (cfg) username platform;
            self = inputs.self;
            hostname = name;
          };

        in
        {
          nixosConfigurations = nixpkgs.lib.mapAttrs
            (name: cfg: nixpkgs.lib.nixosSystem {
              inherit (cfg) system;
              specialArgs = mkArgs name cfg;
              modules = cfg.modules ++ [
                home-manager.nixosModules.home-manager
                ./modules/home/home-manager.nix
              ];
            })
            (nixpkgs.lib.filterAttrs (_: c: c.platform == "linux") hosts);

          # darwin
          darwinConfigurations = nixpkgs.lib.mapAttrs
            (name: cfg: nix-darwin.lib.darwinSystem {
              inherit (cfg) system;
              specialArgs = mkArgs name cfg;
              modules = cfg.modules ++ [
                agenix.darwinModules.default
                home-manager.darwinModules.home-manager
                {
                  home-manager.extraSpecialArgs = mkArgs name cfg;
                }
                ./modules/home/home-manager.nix
              ];
            })
            (nixpkgs.lib.filterAttrs (_: c: c.platform == "darwin") hosts);
        };
    };
}
