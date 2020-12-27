{ config, pkgs, ... }:

{
  xdg.configFile."polybar".source = ./polybar;

  home.packages = [
    pkgs.dmenu
    pkgs.i3lock
    pkgs.networkmanager_dmenu
    pkgs.openbox
    pkgs.playerctl
    pkgs.polybar
    pkgs.rofi
    pkgs.rofi-systemd
  ];
}
