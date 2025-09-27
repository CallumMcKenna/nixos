{ lib, config, pkgs, ... }:

{
	options.browsers = {
		enable = lib.mkEnableOption "Enable defaultBrowsers" // { default = true; };
		tor.enable = lib.mkEnableOption "Install Tor-Browser" // { default = true; };
		librewolf.enable = lib.mkEnableOption "Install LibreWolf" // { default = true; };
	};

	config = lib.mkIf config.browsers.enable {
		environment.systemPackages = lib.mkIf config.browsers.tor.enable [ pkgs.tor-browser ];
	
		programs.firefox = lib.mkIf config.browsers.librewolf.enable {
			enable = true;
			package = pkgs.librewolf;
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
