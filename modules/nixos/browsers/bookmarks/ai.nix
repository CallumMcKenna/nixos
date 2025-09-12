{ lib, config, pkgs, ... }:

let
	inherit (lib) mkEnableOption mkIf;
in
{
	options.browsers.bookmarks.ai.enable = lib.mkEnableOption "Enable ai bookmarks" // { default = true; };

	config = lib.mkIf config.browsers.enable {
		programs.firefox.policies.Bookmarks = [
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
		];
	};
}
