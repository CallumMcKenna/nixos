{ lib, config, ... }:

{
  options.defaultPkgs.lf.enable = lib.mkEnableOption "Enables lf" // { default = true; };

  config = lib.mkIf config.defaultPkgs.enable { # Defined in defaultPkgs.nix
    programs.lf = lib.mkIf config.defaultPkgs.lf.enable {
      enable = true;
      # Add some keybinds here
    };
  };
}
