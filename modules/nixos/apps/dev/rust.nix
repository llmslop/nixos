{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.mine) user;
  cfg = config.mine.apps.dev.rust;
in
{
  options.mine.apps.dev.rust = {
    enable = mkEnableOption "Enable Rust";
  };

  config = mkIf cfg.enable {
    home-manager.users.${user.name} = {
      home.packages = with pkgs; [
        rustc
        cargo
        rust-analyzer
      ];
    };
  };
}
