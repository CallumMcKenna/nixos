{ inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default

		# nixos modules
		./../../modules/nixos/default.nix
		./../../modules/nixos/browsers/default.nix
  ];

	# Enable home manager for my main user
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
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
