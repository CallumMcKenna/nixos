{ lib, config, ... }: {
  options = {
    defaultPkgs.nvf.enable = lib.mkEnableOption "enables nvf" // { default = true; };
    styles = {
      # Penguin is default
      gruvbox.em.enable = lib.mkEnableOption "Enables the eminem theme for all nixos modules" // { default = false; };
      tokyonight.mamoth.enable = lib.mkEnableOption "Enables the mamoth theme for all nixos modules" // { default = false; };
    };
  };

  config = lib.mkIf config.defaultPkgs.enable { # Option enabled in ./defaultPkgs.nix
    programs.nvf = lib.mkIf config.defaultPkgs.nvf.enable {
      enable = true;
      settings = {
        vim = {
          diagnostics = {
            enable = true;
            config = {
              underling = true;
              virtual_text = true;
            };
          };
          options = {
            tabstop = 2;
            shiftwidth = 2;
            wrap = false;
          };
          theme = {
            enable = true;
            name = if config.styles.tokyonight.mamoth.enable then "tokyonight" else "gruvbox";
            style = if config.styles.tokyonight.mamoth.enable then "storm" else "dark";
          };

          # Plugins
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          ui = {
            borders.plugins.which-key.enable = true;
            noice.enable = true;
            breadcrumbs.navbuddy.enable = true;
          };
          notify.nvim-notify.enable = true;
          visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
          };
          autopairs.nvim-autopairs.enable = true;
          statusline.lualine.enable = true;
          assistant.copilot = { # Im not entirely sure how to use this
            enable = true;
            cmp.enable = true;
            setupOpts = {
              panel = {
                enabled = true;
                layout.position = "right";
              };
              suggestion.enabled = true;
            };
          };

          lsp.enable = true;
          languages = {
            enableTreesitter = true;

            nix.enable = true;
            python.enable = true;
            css.enable = true;
            html.enable = true;
            # JS?
            rust.enable = true;
            clang.enable = true; # c/cpp
            csharp.enable = true;
            bash.enable = true;
          };
        };
      };
    };
  };
                      }
