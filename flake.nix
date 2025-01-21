{
  description = "Home Manager configuration of poaclu";

  inputs = {
    # Import nix-config from GitHub
    nix-config.url = "github:Poaclu/nix-config/modules";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nix-config/nixpkgs";
    };
  };

  outputs = { nix-config, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nix-config.inputs.nixpkgs { inherit system; };
    in {
      homeConfigurations."poaclu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
