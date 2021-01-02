{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.s-tui
  ];
}
