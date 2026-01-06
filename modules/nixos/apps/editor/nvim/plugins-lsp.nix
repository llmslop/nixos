{ lib, pkgs, ... }:
{
  plugins = {
    lspconfig.enable = true;
    blink-cmp = {
      enable = true;
      settings.sources = {
        default = [
          "copilot"
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
        providers = {
          copilot = {
            name = "copilot";
            module = "blink-copilot";
            score_offset = 100;
            async = true;
          };
        };
      };
    };
  };

  lsp.servers = {
    clangd = {
      config = {
        cmd = [
          "clangd"
          "--background-index"
        ];
      };
      enable = true;
    };
    lua_ls.enable = true;
    nixd = {
      enable = true;
      config.nixd.formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
    };
  };
}
