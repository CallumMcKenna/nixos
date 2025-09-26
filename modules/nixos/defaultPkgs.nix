{ config, lib, pkgs, ... }:

{
  options.defaultPkgs = {
    enable = lib.mkEnableOption "enables defaultPkgs" // { default = true; };
    tree.enable = lib.mkEnableOption "enables tree" // { default = true; };
    neofetch.enable = lib.mkEnableOption "enables neofetch" // { default = true; };
    git.enable = lib.mkEnableOption "enables git" // { default = true; };
  };

  imports = [
    ./nvf.nix
    ./browsers.nix
  ];

  config = lib.mkIf config.defaultPkgs.enable {
    environment.systemPackages = 
      (lib.optionals config.defaultPkgs.tree.enable [ pkgs.tree ]) ++
      (lib.optionals config.defaultPkgs.neofetch.enable [ pkgs.neofetch ]) ++
      (lib.optionals config.defaultPkgs.git.enable [ pkgs.git ]);
  };
}
