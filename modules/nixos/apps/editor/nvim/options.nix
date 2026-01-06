{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  opts = {
    number = true;
    relativenumber = true;
    termguicolors = true;
    ignorecase = true;
    smartcase = true;
    splitright = true;
    splitbelow = true;
    list = true;
    listchars = mkRaw "{ tab = '» ', trail = '·', nbsp = '␣' }";
    expandtab = true;
    tabstop = 4;
    shiftwidth = 2;
    softtabstop = 0;
    smarttab = true;
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };
    encoding = "utf-8";
    fileencoding = "utf-8";

    undofile = true;
    swapfile = true;
    backup = false;
    autoread = true;

    cursorline = true;
    ruler = true;
    gdefault = true;
    scrolloff = 5;
    foldmethod = "expr";
    foldexpr = "v:lua.vim.lsp.foldexpr()";
    foldlevel = 99;
    foldlevelstart = 99;
  };
}
