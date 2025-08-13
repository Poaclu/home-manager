{ config, pkgs, lib, ... }:
{ 
  options = {
    desktop = {
      enable = lib.mkOption {
        description = "Enable Desktop config for user config";
        type = lib.types.bool;
        default = true;
        example = false;
      };
    };
  };  
  config = lib.mkIf config.desktop.enable {
    home = {
      packages = with pkgs; [
        brave
        brightnessctl
          discord
          discover-overlay
          font-awesome
          libmpdclient
          microsoft-edge
          nautilus
          obsidian
          parsec-bin
          pavucontrol
          playerctl
          protonvpn-gui
          spotify
	  swww
          xfce.thunar
      ];
    };

    programs = {
      kitty = {
        enable = true;
        themeFile = "GruvboxMaterialDarkHard";
        settings = {
          font_family = "Liberation Mono";
          bold_font = "auto";
          italic_font = "auto";
          bold_italic_font = "auto";
          font_size = 8.0;
          background_opacity = 0.7;
          dynamic_background_opacity = "yes";
        };
      };
      zen-browser.enable = true;
    };
    services.flameshot = {
      enable = true;
    };
  };
}
