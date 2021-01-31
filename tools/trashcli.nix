{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.trash-cli
  ];
}
