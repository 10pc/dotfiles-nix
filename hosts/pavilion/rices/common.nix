{
  config,
  pkgs,
  lib,
  ...
}:

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

  programs =
    let
      shellAliases = {
        cls = "clear";
        hms = "nix run home-manager/master -- switch --flake .#\"$1\"";
      };
    in
    {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        # left arrow and right arrow can move per-word
        initContent = lib.mkAfter ''
          bindkey "^[[1;5D" backward-word
          bindkey "^[[1;5C" forward-word

          export EDITOR="nvim"
          eval "$(devenv hook zsh)"
        '';
        shellAliases = shellAliases;
      };

      git = {
        settings = {
          user.name = "10pc";
          user.email = "108258202+10pc@users.noreply.github.com";
        };
      };
    };

  home.stateVersion = "26.05";
}
