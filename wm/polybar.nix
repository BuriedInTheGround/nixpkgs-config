{ config, pkgs, ... }:

let

  custom-polybar = pkgs.polybar.override {
    mpdSupport = true;
    pulseSupport = true;
  };

in
{
  xdg.configFile."polybar".source = ./polybar;

  home.packages = [
    custom-polybar
    pkgs.openbox
    pkgs.playerctl
    pkgs.rofi
    pkgs.rofi-systemd
  ];
}
