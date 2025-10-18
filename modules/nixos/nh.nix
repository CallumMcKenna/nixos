{ config, lib, pkgs, ... }:

{
  options.defaultPkgs.nh.enable = lib.mkEnableOption "enables nh" // { default = true; };

  config = lib.mkIf config.defaultPkgs.nh.enalbe {
    environment = {
      sessionVariables = {
        FLAKE = "/home/callum/config";
      };

      systemPackages = with pkgs; [
        nh
        nix-output-monitor
        nvd
      ]; 
    };
  };
}
