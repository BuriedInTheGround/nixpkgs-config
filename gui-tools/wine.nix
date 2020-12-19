{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wine
  ];
}
