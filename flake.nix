{
  description = "Home Manager configuration of poaclu";

  inputs = {
    # Import nix-config from GitHub
    nix-config.url = "github:Poaclu/nix-config/dev";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nix-config/nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nix-config/nixpkgs";
    };
  };

  outputs = { nix-config, home-manager, zen-browser, hyprland, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = import nix-config.inputs.nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        poaclu = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
              ./modules/minimal.nix
            ];
        };
        "poaclu@killi" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inputs = inputs; };
          modules = [ 
            ./modules/full.nix
            zen-browser.homeModules.default
          ];
        };
        "poaclu@kermel" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inputs = inputs; };
          modules = [ 
            ./modules/full.nix
            zen-browser.homeModules.default
          ];
        };
      };
    };
}
