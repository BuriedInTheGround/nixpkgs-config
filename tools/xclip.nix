{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.xclip
  ];
}
