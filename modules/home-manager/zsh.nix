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
        os-l = "sudo nixos-rebuild switch --flake ~/config/#laptop --cores $(nproc)";
        os-pc = "sudo nixos-rebuild switch --flake ~/config/#pc --cores $(nproc)";
        coll = "nix-collect-garbage --delete-older-than 1d";
        coll-d = "nix-collect-garbage -d";
        dev = "nix develop --command zsh";
        ls = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
        tr-c = "tree ~/config";
        neo = "neofetch";
        py = "python3";
        veiw = "feh";
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
