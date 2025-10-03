{ inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default
		./../../modules/nixos/default.nix
    ./../../modules/nixos/plasma.nix
  ];

  networking.hostName = "pc";

	# Enable home manager for my main user
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
    #useGlobalPkgs = true;
    #useUserPkgs = true;
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

		users = {
			"callum" = import ./home.nix;
		};
	};
}
