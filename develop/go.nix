{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  programs.go = {
    enable = true;
    package = pkgsUnstable.go;
  };
}
