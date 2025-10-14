{ ... }:

{
	# Home Manager needs a bit of information about you and the paths it should manage
	home.username = "callum";
	home.homeDirectory = "/home/callum";

	imports = [
	        ./../../modules/home-manager/default.nix
          ./../../modules/home-manager/plasma.nix
  ];

  alacritty.colorscheme.nord.enable = true;

	home.packages = [];
	home.file = {};
	home.sessionVariables = {};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
	home.stateVersion = "25.05"; # Please read the comment before changing.
}
