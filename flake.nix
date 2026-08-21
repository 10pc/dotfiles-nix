{
  description = "i just hit the jackpooooooot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      lanzaboote,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        pavilion = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/pavilion/configuration.nix

            lanzaboote.nixosModules.lanzaboote
            ({ pkgs, lib, ... }: {
              environment.systemPackages = [
                pkgs.sbctl
              ];

              boot.loader.systemd-boot.enable = lib.mkForce false;

              boot.lanzaboote = {
                enable = true;
                pkiBundle = "/var/lib/sbctl";
                configurationLimit = 10;
              };
            })
          ];
        };
      };

      homeConfigurations = {
        kde-default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./hosts/pavilion/rices/kde-default/home.nix ];
        };
      };
    };
}
