{ lib, config, pkgs, ... }:

let
	inherit (lib) mkEnableOption mkIf;
in
{
	imports = [
		./bookmarks/ai.nix
		./bookmarks/school.nix
	];

	options.browsers = {
		enable = lib.mkEnableOption "Enable defaultBrowsers" // { default = true; };
		tor.enable = lib.mkEnableOption "Install Tor-Browser" // { default = true; };
		librewolf.enable = lib.mkEnableOption "Install LibreWolf" // { default = true; };
		firefox.enable = lib.mkEnableOption "Install FireFox" // { default = true; };
	};

	config = lib.mkIf config.browsers.enable {
		environment.systemPackages = (lib.optionals config.browsers.tor.enable [ pkgs.tor-browser ]) ++ (lib.optionals config.browsers.librewolf.enable [ pkgs.librewolf ]);
	
		programs.firefox = lib.mkIf config.browsers.firefox.enable {
			enable = true;
			languagePacks = [ "de" "en-US" ];
			policies = {
				AppAutoUpdate = true;
				BackgroundAppUpdate = true;
				CaptivePortal = true;
				Cookies.Behavior = "reject-tracker-and-partition-foreign";
				DisableAccounts = true;
				DisableDeveloperTools = false;
				DisableFirefoxStudies = true;
				DisableTelemetry = true;
				ExtensionSettings = {
					"uBlock0@raymondhill.net" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
						installation_mode = "force_installed";
					};
				};
				HttpsOnlyMode = "enabled";
				SearchEngines.Default = "DuckDuckGo";
			};
		};
	};
}
