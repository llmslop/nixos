{
  plugins = {
    copilot-lua = {
      enable = true;
      settings = {
        nes = {
          enabled = true;
          keymap = {
            accept_and_goto = "<leader>y";
            accept = false;
            dismiss = "<Esc>";
          };
        };
      };
    };
    copilot-lsp = {
      enable = true;
    };
    blink-copilot.enable = true;
  };
}
