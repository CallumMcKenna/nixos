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

<<<<<<< HEAD
	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
=======
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
>>>>>>> 470af26 (changed file structure)
}
