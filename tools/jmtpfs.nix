{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.jmtpfs
  ];
}
