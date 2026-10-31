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

        -- Snacks pickers/explorer are floats and would otherwise get kanagawa's
        -- darker NormalFloat background; match the editor's Normal instead.
        local function snacks_hl()
          local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
          for _, g in ipairs({
            "SnacksPicker", "SnacksPickerList", "SnacksPickerInput", "SnacksPickerBox",
            "SnacksPickerPreview", "SnacksNormal", "SnacksNormalNC",
          }) do
            vim.api.nvim_set_hl(0, g, { link = "Normal" })
          end
          -- Borders/titles keep their own fg but must share the editor bg.
          for g, src in pairs({
            SnacksPickerBorder = "FloatBorder", SnacksPickerListBorder = "FloatBorder",
            SnacksPickerInputBorder = "FloatBorder", SnacksPickerBoxBorder = "FloatBorder",
            SnacksPickerPreviewBorder = "FloatBorder", SnacksPickerTitle = "FloatTitle",
            SnacksPickerBoxTitle = "FloatTitle", SnacksPickerInputTitle = "FloatTitle",
            SnacksPickerListTitle = "FloatTitle", SnacksPickerFooter = "FloatFooter",
            SnacksPickerBoxFooter = "FloatFooter", SnacksPickerListFooter = "FloatFooter",
          }) do
            local hl = vim.api.nvim_get_hl(0, { name = src, link = false })
            hl.bg = bg
            vim.api.nvim_set_hl(0, g, hl)
          end
        end
        snacks_hl()
        vim.api.nvim_create_autocmd("ColorScheme", { callback = snacks_hl })
      '';
    };

    statusline.lualine = {
      enable = true;
      setupOpts = {
        options = {
          globalstatus = true; # one statusline across all windows
          component_separators = "";
          section_separators = "";
          theme = "auto"; # follows kanagawa colors
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
