{ pkgs, ... }:
{
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
}
