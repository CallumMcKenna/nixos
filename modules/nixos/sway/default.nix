{ ... }:

{
  imports = [
    ./swaylock.nix
    ./waybar.nix
  ];

  security.polkit.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
