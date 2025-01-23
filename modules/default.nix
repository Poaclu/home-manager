{
  imports = [
    ./shell/
    ./desktop/
    ./user.nix
    ./main.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
