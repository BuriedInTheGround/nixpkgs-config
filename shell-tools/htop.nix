{ config, pkgs, ... }:

{
  programs.zsh.shellAliases.top = "htop";

  programs.htop = {
    enable = true;
  };
}
