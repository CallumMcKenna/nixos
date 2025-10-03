{ lib, config, pkgs, ... }:

{
	options.browsers = {
		enable = lib.mkEnableOption "Enable defaultBrowsers" // { default = true; };
		tor.enable = lib.mkEnableOption "Enables Tor-Browser" // { default = true; };
		brave.enable = lib.mkEnableOption "Enables brave" // { default = true; };
    firefox.enable = lib.mkEnableOption "Enables LibreWolf" // { default = true; };
	};

	config = lib.mkIf config.browsers.enable {
		environment.systemPackages = [
      (lib.optionals config.browsers.tor.enable pkgs.tor-browser)
      (lib.optionals config.browsers.brave.enable pkgs.brave)
    ];

		programs.firefox = lib.mkIf config.browsers.firefox.enable {
			enable = true;
      languagePacks = [ "de" "en-US" ];
		  policies.Bookmarks = [ # IDK why but it isn't working
        {
          Title = "Grok";
          URL = "https://grok.com/";
          Folder = "AI";
        }
        {
          Title = "OpenAI";
          URL = "https://openai.com/";
          Folder = "AI";
        }
        {
          Title = "Claude";
          URL = "https://claude.ai/";
          Folder = "AI";
        }

        {
          Title = "Apps";
          URL = "https://apps.ccsdut.net/";
          Folder = "School";
        }
        {
          Title = "PowerSchool";
          URL = "https://powerschool.ccsdut.org/";
          Folder = "School";
        }
        {
          Title = "Canvas";
          URL = "https://ccsdut.instructure.com/";
          Folder = "School";
        }
      ];
    };
	};
}
