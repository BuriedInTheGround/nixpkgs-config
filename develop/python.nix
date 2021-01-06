{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.python3Full
    pkgs.python3Packages.pip
  ];
}
