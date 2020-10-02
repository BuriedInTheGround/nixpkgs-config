{ config, pkgs, ... }:

{
  programs.gnome-terminal.enable = false;

  programs.zsh =  {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
    };

    history = {
      expireDuplicatesFirst = true;
      save = 1000;
      size = 1000;
    };

    initExtra = ''
      eval "$(direnv hook zsh)"
      bindkey -e
    '';

    initExtraBeforeCompInit = ''
      ZSH_AUTOSUGGEST_USE_ASYNC=TRUE
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "battery"
        "docker-compose"
        "docker"
        "fd"
        "git"
        "golang"
        "history"
        "httpie"
        "man"
        "ripgrep"
        "safe-paste"
        "systemd"
        "themes"
        "vscode"
        "you-should-use"
        "zsh-completions"
      ];
      theme = "robbyrussell";
    };
  };
}
