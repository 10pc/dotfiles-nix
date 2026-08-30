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
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-language-server = {
      url = "github:cushycush/qml-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      lanzaboote,
      home-manager,
      chaotic,
      quickshell,
      qml-language-server,
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
            ./hosts/pavilion

            chaotic.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };

      homeConfigurations = {
        kde-default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./hosts/pavilion/rices/kde-default/home.nix ];
        };
        hyprland = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            quickshell = quickshell.packages.x86_64-linux.default;
            qmlls = qml-language-server.packages.x86_64-linux.default;
          };
          modules = [ ./hosts/pavilion/rices/hyprland ];
        };
      };
    };
}
