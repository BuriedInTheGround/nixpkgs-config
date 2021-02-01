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
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      tree = "tree -I node_modules";
    };

    history = {
      expireDuplicatesFirst = true;
      save = 1000;
      size = 1000;
    };

    initExtra = ''
      eval "$(direnv hook zsh)"
      test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
      bindkey -e

      export GOPATH="$(go env | grep 'GOPATH' | cut -d '=' -f 2 | cut -d '"' -f 2)"
    '';

    initExtraBeforeCompInit = ''
      ZSH_AUTOSUGGEST_MANUAL_REBIND=TRUE
      ZSH_AUTOSUGGEST_USE_ASYNC=TRUE
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        # "battery"
        # "docker-compose"
        # "docker"
        # "fd"
        # "git"
        # "golang"
        # "history"
        # "httpie"
        # "man"
        # "ripgrep"
        # "safe-paste"
        # "systemd"
        # "themes"
        # "vscode"
        "you-should-use"
        # "zsh-completions"
      ];
      theme = "robbyrussell";
    };
  };
}
