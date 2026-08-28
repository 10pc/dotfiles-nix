{ pkgs, inputs, qmlls, ... }:
{
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];
  
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

    qmlls

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
          {
            name = "qt-core";
            publisher = "TheQtCompany";
            version = "1.17.0";
            sha256 = "knBG17lcrr3NP5sxMtbgG6coiEM//caEeei2NWKfJVk=";
          }
        ];
    })
  ];
}
