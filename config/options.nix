{
  vim = {
    # nvf defaults NVIM_APPNAME to "nvf". Use the standard nvim dirs so
    # shada/undo/oldfiles are shared with any other nvim on the system.
    appname = "nvim";

    # Only provide `nvim`; leave /usr/bin/vi and /usr/bin/vim alone.
    viAlias = false;
    vimAlias = false;

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    lineNumberMode = "relNumber";
    searchCase = "smart";
    undoFile.enable = true;

    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    options = {
      # Indentation
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      smartindent = true;
      autoindent = true;

      # UI
      mouse = "a";
      signcolumn = "yes";
      scrolloff = 8;
      cursorline = true;
      termguicolors = true;
      splitright = true;
      splitbelow = true;

      # Timing (snappier which-key / CursorHold)
      updatetime = 250;
      timeoutlen = 400;
    };
  };
}
