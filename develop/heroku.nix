{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.heroku
  ];
}
