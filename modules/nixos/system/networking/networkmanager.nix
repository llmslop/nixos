{
  lib,
  config,
  pkgs,
  ...
}:
let

  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
  inherit (config.mine) user;
  cfg = config.mine.system.networking.networkmanager;

in
{
  options.mine.system.networking.networkmanager = {
    enable = mkEnableOption "Enable NetworkManager";
    hostname = mkOption {
      type = types.str;
      default = "nixos";
      description = "Network hostname";
    };
    applet = mkEnableOption "Enable desktop applet";
  };

  config = mkIf cfg.enable {
    networking = {
      hostName = "${cfg.hostname}";
      networkmanager.enable = true;
      networkmanager.plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };

    users.users.${user.name}.extraGroups = [ "networkmanager" ];
    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

    home-manager.users.${user.name} = mkIf cfg.applet {
      services.network-manager-applet.enable = true;
    };
  };
}
