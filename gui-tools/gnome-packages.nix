{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.gnome3.baobab
    pkgs.gnome3.gnome-calculator
    pkgs.gnome3.gnome-screenshot
    pkgs.gnome3.gnome-system-monitor
    pkgs.gnome3.nautilus
  ];
}
