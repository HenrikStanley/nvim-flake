{pkgs, ...}: {
  vim = {
    # Runtime tools bundled so the config does not depend on the host:
    #   ripgrep/fd -> snacks.picker files/grep
    #   direnv     -> direnv.vim (still run `direnv allow` per project)
    extraPackages = with pkgs; [ripgrep fd direnv];

    treesitter = {
      enable = true;
      fold = false;
      autotagHtml = true;
    };

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = false;
    };

    autopairs.nvim-autopairs.enable = true;

    binds.whichKey = {
      enable = true;
      register = {
        "<leader>f" = "+Find";
        "<leader>h" = "+Git hunks";
        "<leader>l" = "+LSP";
        "<leader>u" = "+Toggle";
      };
    };

    utility = {
      direnv.enable = true;

      oil-nvim = {
        enable = true;
        setupOpts = {
          default_file_explorer = true;
          view_options.show_hidden = true;
          float.border = "single";
        };
      };
    };
  };
}
