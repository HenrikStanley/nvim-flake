{
  # Note: `vim.git.enable` would also pull in fugitive, hunk-nvim,
  # git-conflict and gitlinker. Only gitsigns is wanted for now.
  vim.git.gitsigns = {
    enable = true;
    # Hunk actions stay on nvf's default <leader>h* prefix;
    # move the toggles under <leader>u alongside other toggles.
    mappings = {
      toggleBlame = "<leader>ub";
      toggleDeleted = "<leader>ud";
    };
  };
}
