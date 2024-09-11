{
  description = "My NixOS Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      srujan = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/srujan/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      dev-vm = nixpkgs.lib.nixosSystem {
              specialArgs = {inherit inputs;};
              modules = [
                ./hosts/dev-vm/configuration.nix
                inputs.home-manager.nixosModules.default
              ];
            };
    };
  };
}
