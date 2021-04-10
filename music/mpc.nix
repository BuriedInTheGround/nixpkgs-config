{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.mpc_cli
  ];
}
