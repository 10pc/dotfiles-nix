{
  description = "i just hit the jackpooooooot";

  inputs = {
    nixpgks.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, lanzaboote, ... }:
  {
    nixosConfigurations.pavilion = nixpkgs.lib.nixosSystem {
      system = "x86_64_linux";

      modules = [
        ./hosts/pavilion/configuration.nix
        ./hosts/pavilion/hardware-configuration.nix

        lanzaboote.nixosModules.lanzaboote

        ({ pkgs, lib, ... }: {
          environment.systemPackages = [
            pkgs.sbctl
          ];

          boot.loader.systemd-boot.enable = lib.mkForce false;

          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
        })
      ];
    };
  };
}
