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
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations = {
			programming-wm = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/programming-wm/configuration.nix
					inputs.nvf.nixosModules.default
					inputs.home-manager.nixosModules.default
				];
			};

      programming-env = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/programming-env/configuration.nix
					inputs.nvf.nixosModules.default
					inputs.home-manager.nixosModules.default
				];
			};

      school-wm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/school-wm/configuration.nix
          inputs.nvf.nixosModules.default
          inputs.home-manager.nixosModules.default
        ];
      };

      school-env = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/school-env/configuration.nix
          inputs.nvf.nixosModules.default
          inputs.home-manager.nixosModules.default
        ];
      };
		};
	};
}
