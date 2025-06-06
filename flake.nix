{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./nixos/configuration.nix
            
	    home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.bahrom04 = import ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
	  specialArgs = { inherit inputs; };
        };
      };
    };
}