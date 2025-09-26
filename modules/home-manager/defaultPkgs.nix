{ lib, config, ... }:

{
  options.defaultPkgs = {
    enable = lib.mkEnableOption "Enables the default pkgs for home manager" // { default = true; };
    feh.enable = lib.mkEnableOption "Enables feh(an image veiwer)" // { default = true; };
  };

  imports = [
    ./alacritty.nix
    ./eza.nix
    ./lf.nix
  ];

  config = lib.mkIf config.defaultPkgs.enable {
    programs.feh.enable = lib.mkIf config.defaultPkgs.feh.enable true;
  };
}
