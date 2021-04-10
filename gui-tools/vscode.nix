{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  programs.vscode = {
    enable = true;
    package = pkgsUnstable.vscode;
  };

  home.packages = [
    pkgs.desktop-file-utils
    pkgs.gnome3.libsecret
  ];
}
