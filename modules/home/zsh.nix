{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = lib.mkAfter ''
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      export EDITOR="nvim"
      eval "$(devenv hook zsh)"
    '';

    shellAliases = {
      cls = "clear";
    };
  };
}
