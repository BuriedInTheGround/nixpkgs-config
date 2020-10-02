{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        # normal.family = "Meslo LG S for Powerline";
        normal.family = "Fira Code";
      };
    };
  };
}
