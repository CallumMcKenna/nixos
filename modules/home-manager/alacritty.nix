{ lib, config, ... }:

{
  options.defaultPkgs.alacritty.enable = lib.mkEnableOption "Enable the default home manager pkgs" // { default = true; };

  config = lib.mkIf config.defaultPkgs.enable { # Declared in defaultPkgs.nix
    programs.alacritty = lib.mkIf config.defaultPkgs.alacritty.enable {
      enable = true;
      theme = if config.styles.tokyonight.mamoth.enable then "tokyo_night_storm" else "gruvbox_material";
      settings.window.opacity = 0.9;
    };
  };
}
