{ lib, config, ... }:

{
  options.defaultPkgs.alacritty.enable = lib.mkEnableOption "Enable the default home manager pkgs" // { default = true; };

  config = lib.mkIf config.defaultPkgs.enable { # Declared in defaultPkgs.nix
    programs.alacritty = lib.mkIf config.defaultPkgs.alacritty.enable {
      enable = true;
      theme = "nord";
      settings.window.opacity = 0.9;
    };
  };
}
