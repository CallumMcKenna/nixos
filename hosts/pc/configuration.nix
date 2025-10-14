{ ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../modules/nixos/default.nix
    ./../../modules/nixos/plasma.nix
  ];

  nvf.colorscheme.nord.enable = true;

  networking.hostName = "pc";
  home-manager.users."callum" = import ./home.nix;
}
