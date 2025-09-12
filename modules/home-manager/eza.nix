{ lib, config, ... }:

{
  options.defaultPkgs.eza.enable = lib.mkEnableOption "Enables eza" // { default = true; };

  config = lib.mkIf config.defaultPkgs.enable { # Defined in defaultPkgs.nix
    programs.eza = lib.mkIf config.defaultPkgs.eza.enable {
      enable = true;
      enableZshIntegration = true;
      colors = "always";
      git = true;
    };
  };
}
