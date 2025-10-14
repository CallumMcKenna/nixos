{ lib, config, ... }:

{
  options = {
    defaultPkgs.alacritty.enable = lib.mkEnableOption "Enable the default home manager pkgs" // { default = true; };
    alacritty.colorscheme.nord.enable = lib.mkEnableOption "Changes from gruvbox to nord(gruvbox is the default)" // { default = false; };
  };

  config = lib.mkIf config.defaultPkgs.enable { # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = lib.mkIf config.defaultPkgs.alacritty.enable {
      enable = true;
      theme = if config.alacritty.colorscheme.nord.enable then "nord" else "gruvbox_material";
      settings = {
        window.opacity = 0.9;
        font.normal = {
          family = "Jetbrains Mono Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
