# nvim-flake

Flake of my Neovim configuration with [nvf](https://github.com/notashelf/nvf),
built as a standalone package (no NixOS / Home Manager required).

## Usage

```sh
# Try it without installing
nix run .                       # or: nix run github:<owner>/nvim-flake

# Install into the user profile (~/.nix-profile/bin/nvim shadows /usr/bin/nvim)
nix profile add .

# Update nvf / nixpkgs, then upgrade the installed package
nix flake update
nix profile upgrade nvim-flake

# Uninstall
nix profile remove nvim-flake
```

Optional: the nvf binary cache speeds up builds. As root, add to
`/etc/nix/nix.custom.conf`:

```
extra-substituters = https://nvf.cachix.org
extra-trusted-public-keys = nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI=
```

Debugging: `nvf-print-config` prints the generated `init.lua`.

## Layout

| File                    | Contents                                                       |
| ----------------------- | -------------------------------------------------------------- |
| `flake.nix`             | Inputs (nvf `main`, nixpkgs follows nvf) and outputs            |
| `config/options.nix`    | Leader, editor options, clipboard, undo                        |
| `config/ui.nix`         | kanagawa, mini.statusline, devicons, snacks.nvim               |
| `config/editor.nix`     | treesitter, blink.cmp, autopairs, which-key, oil, direnv |
| `config/git.nix`        | gitsigns                                                       |
| `config/lsp.nix`        | LSP, diagnostics, format-on-save                               |
| `config/languages.nix`  | Per-language LSP / formatter / linter choices                  |
| `config/keymaps.nix`    | Custom keymaps                                                 |

## Languages

Nix (nixd, alejandra), Python (basedpyright + ruff), TypeScript/TSX (ts_ls + biome),
Rust, Go, Bash, Lua, Fish, PowerShell, Astro, Docker, HTML, CSS, Just, Markdown,
YAML, JSON, TOML.

## Keymaps

Leader is `<Space>`.

| Key                | Action                            |
| ------------------ | --------------------------------- |
| `<leader>ff`       | Find files                        |
| `<leader>fg`       | Grep                              |
| `<leader>fw`       | Grep word under cursor            |
| `<leader>fo`       | Recent files                      |
| `<leader><leader>` | Buffers                           |
| `<leader>/`        | Search lines in buffer            |
| `<leader>fh/fk/fd` | Help / keymaps / diagnostics      |
| `<leader>fs/fn`    | Document symbols / notifications  |
| `<leader>fr`       | Resume last picker                |
| `-`                | Oil (floating)                    |
| `<leader>e`        | Toggle explorer (snacks)          |
| `<C-/>`            | Toggle terminal                   |
| `<leader>uf`       | Toggle format on save             |
| `<leader>ub/ud`    | Toggle git blame / deleted lines  |
| `<leader>h*`       | Git hunk actions (gitsigns)       |
| `<leader>l*`       | LSP actions (nvf defaults)        |
| `]c` / `[c`        | Next / previous git hunk          |

Press `<leader>` and wait for which-key to see everything.
