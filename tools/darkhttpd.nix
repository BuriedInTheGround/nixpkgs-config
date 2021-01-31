{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.darkhttpd
  ];
}
