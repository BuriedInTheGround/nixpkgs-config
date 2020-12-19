{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.youtube-dl
  ];
}
