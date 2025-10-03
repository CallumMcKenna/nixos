{ ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../modules/nixos/default.nix
    ./../../modules/nixos/plasma.nix
  ];

  networking.hostName = "pc";
}
