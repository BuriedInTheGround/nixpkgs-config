{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

  signal = pkgsUnstable.signal-desktop.overrideAttrs (oldAttrs: rec {
    version = "5.15.0";

    src = pkgs.fetchurl {
      url = "https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${version}_amd64.deb";
      sha256 = "0cbz2l31cg87n6qlbvwdjy92q9qgmmkrsvaj37cc34ajh7asd833";
    };
  });

in
{
  home.packages = [
    signal
  ];
}
