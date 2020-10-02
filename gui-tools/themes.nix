{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.arc-icon-theme
    pkgs.arc-theme
    pkgs.maia-icon-theme
    pkgs.materia-theme
    pkgs.paper-icon-theme
    pkgs.papirus-icon-theme
  ];
}
