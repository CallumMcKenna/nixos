{ inputs, lib, config, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  options.home-manager.enable = lib.mkEnableOption "Enables home-manager for main user" // { default = true; };

  config = lib.mkIf config.home-manager.enable {
    # Enable home manager for main user
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      #useGlobalPkgs = true;
      #useUserPkgs = true;
      sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
    };
  };
}
