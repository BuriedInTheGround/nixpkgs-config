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
    ./develop/python.nix
    ./develop/redis.nix

    # GUI Tools
    ./gui-tools/audacity.nix
    ./gui-tools/droidcam.nix
    ./gui-tools/gnome-packages.nix
    ./gui-tools/gpodder.nix
    ./gui-tools/obs.nix
    ./gui-tools/spotify.nix
    ./gui-tools/themes.nix
    ./gui-tools/typora.nix
    ./gui-tools/vscode.nix
    ./gui-tools/wine.nix
    ./gui-tools/zeal.nix

    # Music
    ./music/mpc.nix
    ./music/mpd.nix
    # [DISABLED] ./music/mpris.nix
    ./music/ncmpcpp.nix

    # Office
    ./office/libreoffice.nix
    ./office/standardnotes.nix
    ./office/zoom.nix

    # Security
    ./security/bitwarden.nix
    ./security/keychain.nix

    # Shell
    ./shell/alacritty.nix
    ./shell/dircolors.nix
    ./shell/envvars.nix
    ./shell/nnn.nix
    ./shell/zsh.nix

    # Social
    ./social/discord.nix
    ./social/signal.nix
    ./social/slack.nix
    ./social/telegram.nix

    # Tools
    ./tools/bat.nix
    ./tools/bc.nix
    ./tools/cava.nix
    ./tools/colordiff.nix
    ./tools/darkhttpd.nix
    ./tools/fd.nix
    ./tools/fontpreview.nix
    ./tools/fzf.nix
    ./tools/ghostscript.nix
    ./tools/glow.nix
    ./tools/hexedit.nix
    ./tools/htop.nix
    ./tools/httpie.nix
    ./tools/jmtpfs.nix
    ./tools/latex.nix
    ./tools/mmv.nix
    ./tools/pastel.nix
    ./tools/pv.nix
    ./tools/sage.nix
    ./tools/sass.nix
    ./tools/stui.nix
    ./tools/trashcli.nix
    ./tools/tree.nix
    ./tools/xclip.nix
    ./tools/xev.nix
    ./tools/xxd.nix
    ./tools/ytdl.nix
    ./tools/zbar.nix
    ./tools/zscroll.nix

    # Vim
    ./vim/neovim.nix

    # WM
    ./wm/bspwm.nix
    ./wm/dmenu.nix
    ./wm/multilock.nix
    ./wm/polybar.nix
    ./wm/sxhkd.nix
    ./wm/xinitrc.nix
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
