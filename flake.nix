{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

		nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	  plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

	outputs = { self, nixpkgs, ... }@inputs: 
		let                  
      system = "x86_64-linux";
      username = "callum";
    in 
    {
      nixosConfigurations = {
        programming-wm = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/programming-wm/configuration.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };

        pc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;

          modules = [
            ./hosts/pc/configuration.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };
      };
	  };
}
