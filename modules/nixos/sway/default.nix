{ ... }:

{
  imports = [
    ./swaylock.nix
  ];

  security.polkit.enable = true;
}
