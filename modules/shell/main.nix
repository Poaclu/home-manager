{ config, pkgs, lib, ... }:
{ 
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
      packages = with pkgs; [
        bat
        btop
        eza
        fastfetch
        fzf
        starship
        thefuck
        tldr
        zoxide
      ];
    };

    programs = {
      fastfetch.enable = true;
      starship = {
        enable = true;
        enableZshIntegration = true;
      };
      thefuck = {
        enable = true;
        enableZshIntegration = true;
      };
      topgrade.enable = true;
      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = [
            "aliases"
              "colored-man-pages"
              "fzf"
              "ufw"
              "zsh-interactive-cd"
          ];
        };
        initExtra = "source $HOME/.aliasrc\nsource $HOME/.shellrc";
        shellAliases = {
          cd = "z";
          nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/";
          home-rebuild = "home-manager switch --flake ~/.config/home-manager/";
        };
      };
    };
    xdg.configFile = {
      "../.aliasrc".source = ./packages/shell/aliasrc;
      "../.bashrc".source = ./packages/shell/bashrc;
      "../.shellrc".source = ./packages/shell/shellrc;
    };
  };
}
