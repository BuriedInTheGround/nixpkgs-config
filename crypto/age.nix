{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.age
  ];
}
