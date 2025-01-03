{ config, pkgs, ... }: let
username = "poaclu";
in { 
	imports = [
	  ./packages/hypr/hyprland.nix
	];
	home = {
		username = "${username}";
		homeDirectory = "/home/${username}";
		stateVersion = "24.11"; # Please read the comment before changing.
			packages = with pkgs; [
			bat
				brave
				btop
				discord
				eza
				fastfetch
				fzf
				git
				microsoft-edge
				obsidian
				parsec-bin
				spotify
				starship
				xfce.thunar
				thefuck
				tldr
				topgrade
				zoxide
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
		sessionVariables = {
			EDITOR = "nvim";
		};
	};

	nixpkgs.config.allowUnfree = true;

# Let Home Manager install and manage itself.
	programs = {
		btop.enable = true;
		fastfetch.enable = true;
		git = {
			enable = true;
			userName = "Poaclu";
			userEmail = "25772718+Poaclu@users.noreply.github.com";
		};
		home-manager.enable = true;
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
		starship = {
			enable = true;
			enableZshIntegration = true;
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
		thefuck = {
			enable = true;
			enableZshIntegration = true;
		};
		topgrade.enable = true;
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
		zoxide = {
			enable = true;
			enableZshIntegration = true;
		};
		waybar = {
			enable = true;
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
		"btop/btop.conf".source = ./packages/btop/btop.conf;
		"../.aliasrc".source = ./packages/shell/aliasrc;
		"../.bashrc".source = ./packages/shell/bashrc;
		"../.shellrc".source = ./packages/shell/shellrc;
		"topgrade.toml".source = ./packages/topgrade/topgrade.toml;
#"hypr/hyprland.conf".source = ./packages/hypr/hyprland.conf;
	};
}
