{ config, pkgs, ... }:

{
  home.username = "kaupec1";
  home.homeDirectory = "/home/kaupec1";

  home.packages = with pkgs; [
    fastfetch
    cowsay
    btop
    gh
    git
    vesktop
    firefox
    opencode
    nixfmt-tree

    # sorry not sorry
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions =
        with vscode-extensions;
        [
          jnoortheen.nix-ide
        ]
        ++ vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "qt-qml";
            publisher = "TheQtCompany";
            version = "1.15.1";
            sha256 = "pHWqTvuWJKm6Mmt5ycR9C69v+ANgu1tXCNtzliR/dHA=";
          }
        ];
    })
  ];

  home.stateVersion = "26.05";
}
