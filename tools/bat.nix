{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bat
  ];

  home.sessionVariables = {
    BAT_THEME = "Nord";
  };
}
