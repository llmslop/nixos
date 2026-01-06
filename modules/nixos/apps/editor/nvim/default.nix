{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.mine) user;
  cfg = config.mine.apps.editor.nvim;
in
{
  options.mine.apps.editor.nvim = {
    enable = mkEnableOption "Enable neovim";
    default = mkEnableOption "Make neovim the default editor";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nixfmt-rfc-style
    ];

    home-manager.users.${user.name} = {
      imports = [ inputs.nixvim.homeModules.default ];
      programs.nixvim = { lib, ... }: {
        enable = true;
        defaultEditor = mkIf cfg.default true;

        imports = [
          ./globals.nix
          ./options.nix
          ./plugins-ui.nix
          ./plugins-lsp.nix
          ./plugins-treesitter.nix
          ./plugins-copilot.nix
          ./keymaps.nix
        ];
      };
    };
  };
}
