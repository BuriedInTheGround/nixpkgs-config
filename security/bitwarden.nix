{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bitwarden
    pkgs.bitwarden-cli
  ];
}
