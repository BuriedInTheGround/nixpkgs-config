{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./direnv.nix
    ./fontconfig.nix

    # Crypto
    ./crypto/age.nix
    ./crypto/mkcert.nix

    # Develop
    ./develop/git.nix
    ./develop/go.nix

    # GUI Tools
    ./gui-tools/gnome-packages.nix
    ./gui-tools/spotify.nix
    ./gui-tools/themes.nix
    ./gui-tools/typora.nix
    ./gui-tools/wine.nix

    # Misc
    ./misc/cava.nix
    ./misc/httpie.nix
    ./misc/pastel.nix
    ./misc/sass.nix
    ./misc/stui.nix
    ./misc/zscroll.nix

    # Office
    ./office/standardnotes.nix
    ./office/zoom.nix

    # Security
    ./security/bitwarden.nix

    # Shell
    ./shell/alacritty.nix
    ./shell/zsh.nix

    # Shell Tools
    ./shell-tools/bat.nix
    ./shell-tools/bc.nix
    ./shell-tools/fd.nix
    ./shell-tools/fzf.nix
    ./shell-tools/htop.nix
    ./shell-tools/ytdl.nix

    # Social
    ./social/discord.nix
    ./social/signal.nix
    ./social/telegram.nix

    # Vim
    ./vim/neovim.nix

    # WM
    ./wm/bspwm.nix
    ./wm/polybar.nix
    ./wm/sxhkd.nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
