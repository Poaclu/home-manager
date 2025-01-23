{ pkgs, ... }:
{ 
	imports = [
	  ./packages/hypr/hyprland.nix
	];
	home = {
		stateVersion = "24.11"; # Please read the comment before changing.
			packages = with pkgs; [
				brave
				discord
				discover-overlay
				git
				microsoft-edge
				obsidian
				parsec-bin
				pavucontrol
				spotify
				xfce.thunar
			];
		file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
		};

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/poaclu/etc/profile.d/hm-session-vars.sh
#

# Let Home Manager install and manage itself.
	programs = {
		btop.enable = true;
		git = {
			enable = true;
			userName = "Poaclu";
			userEmail = "25772718+Poaclu@users.noreply.github.com";
		};
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
		swaylock = {
			enable = true;
			settings = {
				color = "1e1e2e";
				bs-hl-color = "f5e0dc";
				caps-lock-bs-hl-color = "f5e0dc";
				caps-lock-key-hl-color = "a6e3a1";
				inside-color = "00000000";
				inside-clear-color = "00000000";
				inside-caps-lock-color = "00000000";
				inside-ver-color = "00000000";
				inside-wrong-color = "00000000";
				key-hl-color = "a6e3a1";
				layout-bg-color = "00000000";
				layout-border-color = "00000000";
				layout-text-color = "cdd6f4";
				line-color = "00000000";
				line-clear-color = "00000000";
				line-caps-lock-color = "00000000";
				line-ver-color = "00000000";
				line-wrong-color = "00000000";
				ring-color = "b4befe";
				ring-clear-color = "f5e0dc";
				ring-caps-lock-color = "fab387";
				ring-ver-color = "89b4fa";
				ring-wrong-color = "eba0ac";
				separator-color = "00000000";
				text-color = "cdd6f4";
				text-clear-color = "f5e0dc";
				text-caps-lock-color = "fab387";
				text-ver-color = "89b4fa";
				text-wrong-color = "eba0ac";
			};
		};
		neovim.enable = true;
		wlogout = {
			enable = true;
			layout = [
			{
				label = "lock";
				action = "swaylock";
				text = "Lock";
				keybind = "l";
			}
			{
				label = "hibernate";
				action = "systemctl hibernate && swaylock";
				text = "Hibernate";
				keybind = "h";
			}
			{
				label = "logout";
				action = "loginctl terminate-user $USER";
				text = "Logout";
				keybind = "e";
			}
			{
				label = "shutdown";
				action = "systemctl poweroff";
				text = "Shutdown";
				keybind = "s";
			}
			{
				label = "suspend";
				action = "systemctl suspend && swaylock";
				text = "Suspend";
				keybind = "u";
			}
			{
				label = "reboot";
				action = "systemctl reboot";
				text = "Reboot";
				keybind = "r";
			}
			];
		};
		waybar = {
			enable = true;
		};
	};
	services.flameshot = {
		enable = true;
	};
	xdg.configFile = {
		"btop/btop.conf".source = ./packages/btop/btop.conf;
		"../.aliasrc".source = ./packages/shell/aliasrc;
		"../.bashrc".source = ./packages/shell/bashrc;
		"../.shellrc".source = ./packages/shell/shellrc;
		"topgrade.toml".source = ./packages/topgrade/topgrade.toml;
		"nvim/init.lua".source = ./packages/nvim/init.lua;
#"hypr/hyprland.conf".source = ./packages/hypr/hyprland.conf;
	};
}
