{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  home.packages = [
    pkgsUnstable.sage
  ];
}
