{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  xdg.configFile."multilock".source = ./multilock;

  home.packages = [
    pkgsUnstable.multilockscreen
    pkgs.xss-lock
  ];
}
