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
        os-p = "sudo nixos-rebuild switch --flake ~/config/#programming --cores $(nproc)";
        os-s = "sudo nixos-rebuild switch --flake ~/config/#school --cores $(nproc)";
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
