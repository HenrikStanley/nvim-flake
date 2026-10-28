{
  vim = {
    theme = {
      enable = true;
      name = "kanagawa";
      style = "wave";
      # Runs before nvf's own kanagawa setup(); kanagawa deep-merges repeated
      # setup() calls, so these overrides survive.
      extraConfig = ''
        require("kanagawa").setup({
          colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        })
      '';
    };

    mini.statusline.enable = true;
    visuals.nvim-web-devicons.enable = true;

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        picker.enabled = true;
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
