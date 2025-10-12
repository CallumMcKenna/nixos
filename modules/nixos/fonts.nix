{ lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
