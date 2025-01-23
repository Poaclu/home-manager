{ config, pkgs, lib, ... }: let
username = "poaclu";
in { 
  options = {
    shell = {
      enable = lib.mkOption {
        description = "Enable Shell config for user config";
        type = lib.types.bool;
        default = true;
        example = false;
      };
    };
  };  
  config = lib.mkIf config.shell.enable {
    home = {
      stateVersion = "24.11"; # Please read the comment before changing.
    };

    programs = {
      git = {
        enable = true;
        userName = "Poaclu";
        userEmail = "25772718+Poaclu@users.noreply.github.com";
      };
      topgrade.enable = true;
      };
    };
    xdg.configFile = {
      "../.aliasrc".source = ./packages/shell/aliasrc;
      "../.bashrc".source = ./packages/shell/bashrc;
      "../.shellrc".source = ./packages/shell/shellrc;
      "topgrade.toml".source = ./packages/topgrade/topgrade.toml;
    };
  }
