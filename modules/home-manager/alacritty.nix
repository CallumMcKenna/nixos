{ lib, config, ... }:

{
  options.defaultPkgs.alacritty.enable = lib.mkEnableOption "Enable the default home manager pkgs" // { default = true; };

  config = lib.mkIf config.defaultPkgs.enable { # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = lib.mkIf config.defaultPkgs.alacritty.enable {
      enable = true;
      theme = "gruvbox_material";
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
