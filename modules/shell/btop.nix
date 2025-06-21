{ config, pkgs, lib, ... }: let
username = "poaclu";
in { 
  options = {
    shell = {
      btop = {
        enable = lib.mkOption {
          description = "Enable btop config for user config";
          type = lib.types.bool;
          default = true;
          example = false;
        };
        #refresh = lib.mkOption {
          #description = "Refresh rate in ms for btop";
          #type = lib.types.int;
          #default = 300;
          #example = 1000;
        #};
      };
    };
  };  
  config = lib.mkIf config.btop.enable {
    programs.btop.enable = true;
    xdg.configFile = {
      "config/btop.conf".source = ./packages/btop/btop.conf;
    };
  };
}
