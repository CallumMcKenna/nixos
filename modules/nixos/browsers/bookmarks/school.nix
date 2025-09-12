{ lib, config, ... }:

{
	options.browsers.firefox.bookmarks.school.enable = lib.mkEnableOption "Enable school bookmarks" // { default = false; };

	config = lib.mkIf config.browsers.firefox.bookmarks.school.enable {
		programs.firefox.policies.Bookmarks = [
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
}
