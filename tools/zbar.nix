{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.zbar
  ];
}
