{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.tectonic
    pkgs.raleway
    pkgs.biber
  ];
}
