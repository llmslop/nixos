{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.mine) user;
  cfg = config.mine.apps.shell.direnv;
in
{
  options.mine.apps.shell.direnv = {
    enable = mkEnableOption "Enable direnv + nix-direnv";
  };

  config = mkIf cfg.enable {
    home-manager.users.${user.name} = {
      programs.direnv = {
        enable = true;
        enableBashIntegration = mkIf config.mine.apps.shell.bash.enable true;
        nix-direnv.enable = true;
      };
    };
  };
}
