{ config, pkgs, ... }:

{
  xdg.configFile."polybar".source = ./polybar;

  home.packages = [
    pkgs.openbox
    pkgs.playerctl
    pkgs.polybar
    pkgs.rofi
    pkgs.rofi-systemd
  ];
}
