{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.keychain
  ];
}
