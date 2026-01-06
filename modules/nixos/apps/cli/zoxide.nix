{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.mine) user;
  cfg = config.mine.apps.cli.zoxide;
in
{
  options.mine.apps.cli.zoxide = {
    enable = mkEnableOption "Enable Zoxide";
  };

  config = mkIf cfg.enable {
    home-manager.users.${user.name} = {
      programs.zoxide = {
        enable = true;
        enableBashIntegration = mkIf config.mine.apps.shell.bash.enable true;
      };
    };
  };
}
