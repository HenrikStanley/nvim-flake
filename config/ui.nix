{
  pkgs,
  hokusai-nvim,
  ...
}: {
  vim = {
    theme.enable = false;

    extraPlugins.hokusai = {
      package = pkgs.vimUtils.buildVimPlugin {
        pname = "hokusai-nvim";
        version = "git";
        src = hokusai-nvim;
        # hokusai.docs is a dev-only module that requires lazy.nvim.
        nvimSkipModules = ["hokusai.docs"];
      };
      setup = ''
        vim.cmd.colorscheme("hokusai-zen")
      '';
    };

    statusline.lualine = {
      enable = true;
      setupOpts = {
        options = {
          globalstatus = true; # one statusline across all windows
          component_separators = "";
          section_separators = "";
          theme = "auto"; # follows hokusai colors
        };
      };
    };
    visuals.nvim-web-devicons.enable = true;

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        picker = {
          enabled = true;
          sources.explorer = {
            hidden = true;
            ignored = true;
            auto_close = true;
          };
        };
        explorer.enabled = true;
        notifier.enabled = true;
        terminal.enabled = true;
        indent.enabled = true;
        dashboard = {
          enabled = true;
          # The default "startup" section requires lazy.nvim's stats module,
          # which does not exist under nvf.
          sections = [
            {section = "header";}
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              section = "recent_files";
              title = "Recent Files";
              cwd = true;
              limit = 5;
              padding = 1;
            }
          ];
        };
        input.enabled = true;
      };
    };
  };
}
