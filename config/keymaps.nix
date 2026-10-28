let
  # Helper: normal-mode keymap running a Lua function.
  luaMap = key: action: desc: {
    inherit key desc;
    mode = "n";
    lua = true;
    action = "function() ${action} end";
  };
in {
  vim.keymaps = [
    # --- Picker (snacks.picker) -------------------------------------------
    (luaMap "<leader>ff" "Snacks.picker.files()" "Find files")
    (luaMap "<leader>fg" "Snacks.picker.grep()" "Find by grep")
    (luaMap "<leader>fw" "Snacks.picker.grep_word()" "Find word under cursor")
    (luaMap "<leader>fh" "Snacks.picker.help()" "Find help")
    (luaMap "<leader>fk" "Snacks.picker.keymaps()" "Find keymaps")
    (luaMap "<leader>fd" "Snacks.picker.diagnostics()" "Find diagnostics")
    (luaMap "<leader>fr" "Snacks.picker.resume()" "Resume last picker")
    (luaMap "<leader>fo" "Snacks.picker.recent()" "Find recent files")
    (luaMap "<leader>fb" "Snacks.picker.pickers()" "Find pickers")
    (luaMap "<leader>fs" "Snacks.picker.lsp_symbols()" "Find document symbols")
    (luaMap "<leader>fn" "Snacks.picker.notifications()" "Find notifications")
    (luaMap "<leader><leader>" "Snacks.picker.buffers()" "Find buffers")
    (luaMap "<leader>/" "Snacks.picker.lines()" "Search in buffer")

    # --- Explorers ---------------------------------------------------------
    {
      key = "-";
      mode = "n";
      action = "<cmd>Oil --float<CR>";
      desc = "Open parent directory (oil)";
    }
    {
      key = "<leader>e";
      mode = "n";
      action = "<cmd>Neotree toggle<CR>";
      desc = "Toggle file tree (neo-tree)";
    }

    # --- Terminal ----------------------------------------------------------
    # Many terminals/tmux send <C-/> as <C-_>, so map both.
    {
      key = "<C-/>";
      mode = ["n" "t"];
      lua = true;
      action = "function() Snacks.terminal.toggle() end";
      desc = "Toggle terminal";
    }
    {
      key = "<C-_>";
      mode = ["n" "t"];
      lua = true;
      action = "function() Snacks.terminal.toggle() end";
      desc = "which_key_ignore";
    }

    # --- Misc --------------------------------------------------------------
    {
      key = "<Esc>";
      mode = "n";
      action = "<cmd>nohlsearch<CR>";
      desc = "Clear search highlight";
    }
  ];
}
