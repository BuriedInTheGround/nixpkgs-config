{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.httpie
  ];
}
