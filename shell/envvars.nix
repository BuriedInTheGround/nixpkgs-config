{ config, pkgs, ... }:

{
  home.sessionVariables = {
    PAGER = "less -R --mouse --wheel-lines 3";
  };
}
