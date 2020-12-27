{ config, pkgs, ... }:

{
  xdg.configFile."sxhkd".source = ./sxhkd;
}
