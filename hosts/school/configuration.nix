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

  browsers.tor.enable = false;
  browsers.librewolf.enable = false;
 	browsers.firefox.bookmarks.school.enable = true;

	# Enable home manager for my main user
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"callum" = import ./home.nix;
		};
	};

	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
}
