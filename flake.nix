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

        programming-env = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;

          modules = [
            ./hosts/programming-env/configuration.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
                #users."${username}" = import ./hosts/programming-env/home.nix;
              };
            }
          ];
        };
      };
	  };
}
