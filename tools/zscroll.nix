{ config, pkgs, ... }:

let

  zscroll = pkgs.zscroll.overrideAttrs (oldAttrs: rec {
    src = builtins.fetchGit {
      url = "https://github.com/noctuid/zscroll.git";
      rev = "011269a0339c78beb900cdcac1fb7bac374a5464";
    };
  });

in
{
  home.packages = [
    zscroll
  ];
}
