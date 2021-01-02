{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.xorg.xev
  ];
}
