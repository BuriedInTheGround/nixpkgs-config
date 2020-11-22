{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.file."fonts.conf" = {
    source = ./fonts.conf;
    target = "./.config/fontconfig/fonts.conf";
  };
}
