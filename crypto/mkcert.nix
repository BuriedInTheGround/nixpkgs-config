{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.mkcert
    pkgs.cacert
    pkgs.nss
    pkgs.nssTools
  ];
}
