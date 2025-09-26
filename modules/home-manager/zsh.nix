{ config, lib, ... }:

{
  options.zsh.enable = lib.mkEnableOption "enables zsh" // { default = true; };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        os-wm = "sudo nixos-rebuild switch --flake ~/config/#programming-wm --cores $(nproc)";
        os-env = "sudo nixos-rebuild switch --flake ~/config/#programming-env --cores $(nproc)";
        coll = "nix-collect-garbage";
        coll-d = "nix-collect-garbage --delete-old";
        dev = "nix develop --command zsh";
        l = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
        tr-c = "tree ~/config";
        neo = "neofetch";
        py = "python3";
      };
      history.size = 10000;

      zplug = {
        enable = true;
        plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        ];
      };
    };
  };
}
