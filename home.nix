{ config, pkgs, ... }: let
  username = "poaclu";
in { 
  imports = [
    ./packages
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05"; # Please read the comment before changing.
    packages = with pkgs; [
      bat
      brave
      btop
      eza
      fastfetch
      git
      obsidian
      parsec-bin
      starship
      xfce.thunar
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
  programs.home-manager.enable = true;
}
