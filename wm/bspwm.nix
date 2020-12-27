{ config, pkgs, ... }:

{
  xdg.configFile."bspwm".source = ./bspwm;

  home.packages = [
    pkgs.feh
    pkgs.picom
    pkgs.unclutter
  ];
}
