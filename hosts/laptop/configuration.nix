{ ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../modules/nixos/default.nix
    ./../../modules/nixos/sway/default.nix
  ];

  networking.hostName = "laptop";
  home-manager.users."callum" = import ./home.nix;
}
