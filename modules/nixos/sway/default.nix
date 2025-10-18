{ ... }:

{
  imports = [
    ./swaylock.nix
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
