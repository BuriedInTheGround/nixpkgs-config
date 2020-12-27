{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  xdg.configFile."fonts.conf" = {
    source = ./fonts.conf;
    target = "fontconfig/fonts.conf";
  };
}
