{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.sxhkd
    pkgs.brightnessctl
  ];

  xdg.configFile."sxhkd".source = ./sxhkd;
}
