{ ... }:

let
	# Gruvbox colorscheme
	grey = "3c3836";
	light-grey = "7c6f64";
	white = "dfbf8e";
	red = "cc241d";
	green = "98971a";
	yellow = "d79921";
	blue = "458588";
	purple = "b16286";
	aqua = "689d6a";
	orange = "d65d0e";
in
{
  programs.swaylock = {
    enable = true;
    settings = {
      disable-caps-lock-text = true;
      color = "${grey}";
      bs-hl-color = "${red}";
      indicator-idle-visible = true;
      indicator-radius = 100;
      indicator-thickness = 15;
      inside-color = "${blue}";
      inside-clear-color = "${orange}";
      inside-ver-color = "${aqua}";
      inside-wrong-color = "${red}";
      key-hl-color = "${aqua}";
      layout-text-color = "${white}";
      ring-color = "${blue}";
      ring-clear-color = "${orange}";
      ring-ver-color = "${aqua}";
      ring-wrong-color = "${red}";
      text-color = "${white}";
    };
  };
}
