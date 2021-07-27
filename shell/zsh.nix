{ config, pkgs, ... }:

{
  home.file."aliases.zsh".source = ./aliases.zsh;
  xdg.configFile."zsh-custom".source = ./zsh;

  home.file.".zshrc".text = ''
    typeset -U fpath  # typeset -U path cdpath fpath manpath

    # Autocompletion {{{
    autoload -U compinit && compinit

    zmodload -i zsh/complist

    unsetopt menu_complete  # Do not autoselect the first completion entry.
    unsetopt flowcontrol
    setopt auto_menu  # Show completion menu on successive tab press.
    setopt complete_in_word
    setopt always_to_end

    bindkey -M menuselect '^o' accept-and-infer-next-history
    zstyle ':completion:*:*:*:*:*' menu select

    # Case insensitive (aA) and hyphen insensitive (-_).
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

    # Complete . and .. special directories.
    zstyle ':completion:*' special-dirs true

    zstyle ':completion:*' list-colors ""
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

    # Disable named-directories autocompletion.
    zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

    # Use caching.
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path $HOME/.cache/zsh

    # Load bash completion functions.
    autoload -U +X bashcompinit && bashcompinit
    # }}}

    # Enable autosuggestions.
    ZSH_AUTOSUGGEST_MANUAL_REBIND=TRUE
    ZSH_AUTOSUGGEST_USE_ASYNC=TRUE
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

    # Add envirnoment variables.
    . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
    export GOPATH="$(go env | grep 'GOPATH' | cut -d '=' -f 2 | cut -d '"' -f 2)"
    export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin

    # Source some Oh-My-Zsh libs.
    source $HOME/.config/zsh-custom/lib/git.zsh
    source $HOME/.config/zsh-custom/lib/key-bindings.zsh
    source $HOME/.config/zsh-custom/lib/theme-and-appearance.zsh

    # Enable you-should-use.
    source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh

    # Enable Go plugin
    source $HOME/.config/zsh-custom/plugins/golang/golang.plugin.zsh

    # History {{{
    HISTFILE=$HOME/.zsh_history
    HISTSIZE=1000
    SAVEHIST=1000

    setopt HIST_FCNTL_LOCK
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_SPACE
    setopt HIST_EXPIRE_DUPS_FIRST
    setopt SHARE_HISTORY
    unsetopt EXTENDED_HISTORY
    # }}}

    # Enable auto cd.
    setopt autocd

    # Enable direnv.
    eval "$(direnv hook zsh)"

    # Evaluate dir_colors.
    test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

    # Vi mode {{{
    bindkey -v
    export KEYTIMEOUT=5

    # Use vim keys in tab complete menu.
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -v '^?' backward-delete-char

    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;       # Use block shape.
        viins|main) echo -ne '\e[6 q';;  # Use beam shape.
      esac
    }
    zle -N zle-keymap-select
    zle-line-init() {
      zle -K viins
      echo -ne '\e[6 q'
    }
    zle -N zle-line-init
    echo -ne '\e[6 q' # Use beam shape cursor at startup.
    preexec() { echo -ne '\e[6 q'; } # Use beam shape cursor for each new prompt.
    # }}}

    if [[ $options[zle] = on ]]; then
      . ${pkgs.fzf}/share/fzf/completion.zsh
      . ${pkgs.fzf}/share/fzf/key-bindings.zsh
    fi

    # Bindings.
    bindkey -M viins '^[[A' up-line-or-beginning-search
    bindkey -M vicmd '^[[A' up-line-or-beginning-search
    bindkey -M viins '^[[B' down-line-or-beginning-search
    bindkey -M vicmd '^[[B' down-line-or-beginning-search

    # Enable syntax highlighting.
    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # Load the theme.
    autoload -U colors && colors
    source $HOME/.config/zsh-custom/themes/lambda-plus.zsh-theme

    # Load aliases.
    . "$HOME/aliases.zsh"

    # vim:foldmethod=marker:foldlevel=0
  '';
}
