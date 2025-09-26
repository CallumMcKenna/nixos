{ inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default

		# nixos modules
		./../../modules/nixos/default.nix
		./../../modules/nixos/browsers/default.nix
<<<<<<< HEAD
    #./../../modules/nixos/vpn/vpn.nix
=======
>>>>>>> 470af26 (changed file structure)
  ];

	# Enable home manager for my main user
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"callum" = import ./home.nix;
		};
	};
<<<<<<< HEAD

	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
=======
>>>>>>> 470af26 (changed file structure)
}
