{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.python
  ];
}
