{ inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default

		# nixos modules
		./../../modules/nixos/default.nix
		./../../modules/nixos/browsers/default.nix
    #./../../modules/nixos/vpn/vpn.nix
  ];

	# Enable home manager for my main user
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"callum" = import ./home.nix;
		};
	};
}
