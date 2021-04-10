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
    ./crypto/openssl.nix

    # Develop
    ./develop/gcc.nix
    ./develop/git.nix
    ./develop/go.nix
    ./develop/heroku.nix
    ./develop/make.nix
    ./develop/nodejs.nix
    ./develop/php.nix
    ./develop/postgresql.nix
    ./develop/python.nix

    # GUI Tools
    ./gui-tools/droidcam.nix
    ./gui-tools/gnome-packages.nix
    ./gui-tools/obs.nix
    ./gui-tools/spotify.nix
    ./gui-tools/themes.nix
    ./gui-tools/typora.nix
    ./gui-tools/wine.nix

    # Office
    ./office/standardnotes.nix
    ./office/zoom.nix

    # Security
    ./security/bitwarden.nix
    ./security/keychain.nix

    # Shell
    ./shell/alacritty.nix
    ./shell/dircolors.nix
    ./shell/zsh.nix

    # Social
    ./social/discord.nix
    ./social/signal.nix
    ./social/telegram.nix

    # Tools
    ./tools/bat.nix
    ./tools/bc.nix
    ./tools/cava.nix
    ./tools/darkhttpd.nix
    ./tools/fd.nix
    ./tools/fzf.nix
    ./tools/ghostscript.nix
    ./tools/htop.nix
    ./tools/httpie.nix
    ./tools/latex.nix
    ./tools/mmv.nix
    ./tools/pastel.nix
    ./tools/sass.nix
    ./tools/stui.nix
    ./tools/trashcli.nix
    ./tools/tree.nix
    ./tools/xclip.nix
    ./tools/xev.nix
    ./tools/ytdl.nix
    ./tools/zscroll.nix

    # Vim
    ./vim/neovim.nix

    # WM
    ./wm/bspwm.nix
    ./wm/multilock.nix
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
