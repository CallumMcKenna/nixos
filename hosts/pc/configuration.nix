{ inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default

		# nixos modules
		./../../modules/nixos/default.nix
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

  services = {
    desktopManager.plasma6.enable = true;
   displayManager.sddm = {
     enable = true;
     wayland.enable = true;
   };
  };
}
