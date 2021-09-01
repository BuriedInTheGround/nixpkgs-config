{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  xdg.configFile."gpodder-scripts".source = ./gpodder-scripts;

  home.packages = [
    pkgsUnstable.gpodder
  ];
}
