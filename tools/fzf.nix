{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
  };

  home.sessionVariables = {
    FZF_CTRL_T_OPTS = "--no-height --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
    FZF_ALT_C_OPTS = "--preview 'tree -c {} | head -200'";
  };
}
