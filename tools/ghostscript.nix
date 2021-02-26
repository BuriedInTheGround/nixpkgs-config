{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.ghostscript
  ];
}
