{
  lib,
  pkgs,
  ...
}: {
  # nvf's astro preset only looks for `node_modules/typescript` in the project
  # and crashes the server when it is missing (e.g. before `npm install`).
  # Fall back to the TypeScript shipped with this config.
  vim.lsp.servers.astro-language-server.before_init = lib.mkForce (lib.generators.mkLuaInline ''
    function(_, config)
      local ts = config.init_options and config.init_options.typescript
      if ts and not ts.tsdk then
        local tsdk = "${pkgs.typescript_5}/lib/node_modules/typescript/lib"
        local mods = vim.fs.find("node_modules", { path = config.root_dir, upward = true, limit = math.huge })
        for _, dir in ipairs(mods) do
          if vim.uv.fs_stat(dir .. "/typescript/lib") then
            tsdk = dir .. "/typescript/lib"
            break
          end
        end
        ts.tsdk = tsdk
      end
    end
  '');

  # PowerShell Editor Services drops PowerShellEditorServices.json into the
  # cwd unless told otherwise; keep it in Neovim's cache dir instead.
  vim.lsp.servers.powershell-editor-services.cmd = lib.mkForce (lib.generators.mkLuaInline ''
    {
      "${lib.getExe pkgs.powershell-editor-services}",
      "-LogLevel", "Error",
      "-Stdio",
      "-SessionDetailsPath", (function()
        local dir = vim.fn.stdpath("cache")
        vim.fn.mkdir(dir, "p")
        return dir .. "/powershell-editor-services.json"
      end)(),
    }
  '');

  vim.languages = {
    nix = {
      enable = true;
      lsp.servers = ["nixd"];
      format.type = ["alejandra"];
      # extra diagnostics: statix + deadnix (nvf defaults)
    };

    python = {
      enable = true;
      # basedpyright for types, ruff LSP for lint diagnostics + code actions.
      lsp.servers = ["basedpyright" "ruff"];
      format.type = ["ruff"];
      # mypy would duplicate basedpyright's type checking.
      extraDiagnostics.enable = false;
    };

    typescript = {
      enable = true;
      lsp.servers = ["typescript-language-server"];
      format.type = ["biome"];
      extraDiagnostics.types = ["biomejs"];
    };

    tsx = {
      enable = true;
      lsp.servers = ["typescript-language-server"];
      format.type = ["biome"];
      extraDiagnostics.types = ["biomejs"];
    };

    rust.enable = true;
    go.enable = true;
    bash.enable = true;

    lua = {
      enable = true;
      # lua-language-server already reports undefined globals etc.;
      # luacheck is noisy about `vim` without a project .luacheckrc.
      extraDiagnostics.enable = false;
    };

    fish.enable = true;
    powershell.enable = true;
    astro.enable = true;
    docker.enable = true;
    html.enable = true;

    css = {
      enable = true;
      format.type = ["biome"];
    };

    just.enable = true;
    markdown.enable = true;
    yaml.enable = true;

    json = {
      enable = true;
      format.type = ["biome"];
    };

    toml.enable = true;
  };
}
