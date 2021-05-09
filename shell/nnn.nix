{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

  nnn = pkgsUnstable.nnn.override { withNerdIcons = true; };

in
{
  home.packages = [
    pkgs.file
    pkgs.ffmpegthumbnailer
    pkgs.imagemagick
    pkgs.poppler_utils
    pkgs.sxiv
    pkgs.ueberzug
    pkgsUnstable.dragon-drop
    pkgsUnstable.pistol
    nnn
  ];

  home.sessionVariables = {
    GUI = 1;
    NNN_OPTS = "x";
    NNN_OPENER = "/home/simone/.config/nnn/plugins/nuke";
    NNN_PLUG = "o:fzopen;f:fzcd;h:hexview;d:dragdrop;p:preview-tui-ext;s:chksum";
    NNN_FCOLORS = "0b0b0406000606ff09060b06";
    NNN_TRASH = 1; # n=1: trash-cli, n=2: gio trash
    NNN_FIFO = "/tmp/nnn.fifo";
  };
}
