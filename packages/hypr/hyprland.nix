{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			monitor = ",preferred,auto,auto,vrr,1";
			"$terminal" = "kitty";
			"$fileManager" = "dolphin";
			"$apps" = "wofi --show drun";
			"$browser" = "firefox";
			"$menu" = "wlogout";
			"$lock" = "swaylock";
			exec-once = [ 
				"$terminal"
				"nm-applet --indicator &"
				"waybar &"
				"swww-daemon && swww img ~/Images/Wallpaper/1i918gwz1gl61.png"
			];
			env = [ 
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
			];
			general = { 
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;
				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";
				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};
			decoration = {
				rounding = 10;
					active_opacity = 1.0;
					inactive_opacity = 1.0;
					blur = {
						enabled = true;
						size = 3;
						passes = 1;
						vibrancy = 0.1696;
					};
			};
			animations = {
				enabled = true;
					bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
			};
			dwindle = {
				pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section belou
					preserve_split = true; # You probably want this
			};
			#master = {
			#	new_status = master;
			#};
			misc = { 
				vrr = 1;
				force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
					disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
							};
							input = {
							kb_layout = "fr";
							follow_mouse = 1;
							sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
							touchpad = {
							natural_scroll = true;
							};
							};
							gestures = {
								workspace_swipe = false;
							};
							device = {
								name = "epic-mouse-v1";
								sensitivity = -0.5;
							};
							"$mainMod" = "SUPER"; # Sets "Windows" key as main modifier";
							bind = [ 
								"$mainMod, Q, exec, $terminal"
								"$mainMod, C, killactive,"
								"$mainMod, M, exit,"
								"$mainMod, E, exec, $fileManager"
								"$mainMod, V, togglefloating,"
								"$mainMod, R, exec, $apps"
								"$mainMod, P, pseudo, # dwindle"
								"$mainMod, J, togglesplit, # dwindle"
								"$mainMod, B, exec, brave"
								"$mainMod, F, exec, firefox"
								"$mainMod, L, exec, $lock"
								"Control_L Alt_L, Delete, exec, $menu"
								"$mainMod, left, movefocus, l"
								"$mainMod, right, movefocus, r"
								"$mainMod, up, movefocus, u"
								"$mainMod, down, movefocus, d"
								"$mainMod, $desk1, workspace, 1"
								"$mainMod, $desk2, workspace, 2"
								"$mainMod, $desk3, workspace, 3"
								"$mainMod, $desk4, workspace, 4"
								"$mainMod, $desk5, workspace, 5"
								"$mainMod, $desk6, workspace, 6"
								"$mainMod, $desk7, workspace, 7"
								"$mainMod, $desk8, workspace, 8"
								"$mainMod, $desk9, workspace, 9"
								"$mainMod, $desk10, workspace, 10"
								"$mainMod SHIFT, $desk1, movetoworkspace, 1"
								"$mainMod SHIFT, $desk2, movetoworkspace, 2"
								"$mainMod SHIFT, $desk3, movetoworkspace, 3"
								"$mainMod SHIFT, $desk4, movetoworkspace, 4"
								"$mainMod SHIFT, $desk5, movetoworkspace, 5"
								"$mainMod SHIFT, $desk6, movetoworkspace, 6"
								"$mainMod SHIFT, $desk7, movetoworkspace, 7"
								"$mainMod SHIFT, $desk8, movetoworkspace, 8"
								"$mainMod SHIFT, $desk9, movetoworkspace, 9"
								"$mainMod SHIFT, $desk10, movetoworkspace, 10"
								"$mainMod, S, togglespecialworkspace, magic"
								"$mainMod SHIFT, S, movetoworkspace, special:magic"
								"$mainMod, mouse_down, workspace, e+1"
								"$mainMod, mouse_up, workspace, e-1"
							];
							"$desk1" = "ampersand";
							"$desk2" = "eacute";
							"$desk3" = "quotedbl";
							"$desk4" = "apostrophe";
							"$desk5" = "parenleft";
							"$desk6" = "minus";
							"$desk7" = "egrave";
							"$desk8" = "underscore";
							"$desk9" = "ccedilla";
							"$desk10" = "agrave";
							bindm = [ 
								"$mainMod, mouse:272, movewindow"
								"$mainMod, mouse:273, resizewindow"
							];
							windowrulev2 = [ 
								"suppressevent maximize, class:.* # You'll probably like this."
							];
		};
	};
}
