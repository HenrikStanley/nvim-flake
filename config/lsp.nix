{
  vim = {
    lsp = {
      # Required for language modules to hook into the LSP API.
      enable = true;

      # conform.nvim formats on save; toggle at runtime with <leader>uf.
      formatOnSave = true;

      inlayHints.enable = false;

      mappings.toggleFormatOnSave = "<leader>uf";
    };

    diagnostics = {
      enable = true;
      config = {
        signs = true;
        underline = true;
        virtual_text = true;
        severity_sort = true;
        float.border = "rounded";
      };
    };

    languages = {
      # Global toggles inherited by every enabled language module.
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;
    };
  };
}
