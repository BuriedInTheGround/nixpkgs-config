{ config, pkgs, ... }:

let

  dmenu = pkgs.dmenu.overrideAttrs (oldAttrs: rec {
    patches = [
      ./dmenu/dmenu-fuzzymatch-4.9.diff
      ./dmenu/dmenu-fuzzyhighlight-4.9.diff
    ];
  });

in
{
  home.packages = [
    dmenu
    pkgs.networkmanager_dmenu
  ];
}
