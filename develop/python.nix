{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.python39Full
    pkgs.python3Packages.pip
    pkgs.python3Packages.setuptools
  ];
}
