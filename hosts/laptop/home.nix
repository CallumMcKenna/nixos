{ ... }:

{
	# Home Manager needs a bit of information about you and the paths it should manage
	home.username = "callum";
	home.homeDirectory = "/home/callum";

	imports = [
	        ./../../modules/home-manager/default.nix
          ./../../modules/home-manager/sway/default.nix
  ];

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "25.05"; # Please read the comment before changing.

	home.packages = [];
	home.file = {};
	home.sessionVariables = {};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
