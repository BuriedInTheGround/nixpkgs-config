{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixos-unstable> {};

in
{
  programs.alacritty = {
    enable = true;
    package = pkgsUnstable.alacritty;
    settings = {
      window = {
        startup_mode = "Maximized";
        title = "Alacritty";
        dynamic_title = true;
      };
      background_opacity = 0.92;
      font = {
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
      };
    };
  };
}
