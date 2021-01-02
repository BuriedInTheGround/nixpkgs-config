{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.sxhkd
  ];

  xdg.configFile."sxhkd".source = ./sxhkd;
}
