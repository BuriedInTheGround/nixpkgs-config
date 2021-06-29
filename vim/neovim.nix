{ config, pkgs, lib, vimUtils, ... }:

let

  pluginGit = repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = "HEAD";
    src = builtins.fetchGit {
     url = "https://github.com/${repo}.git";
     ref = "HEAD";
    };
  };

in
{
  xdg.configFile."nvim".source = ./nvim;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      source $HOME/.config/nvim/init.vim
    '';
    plugins = with pkgs.vimPlugins; [
      # Theming
      nord-vim
      vim-airline
      vim-airline-themes
      vim-monokai

      # Fuzzy Finder
      fzf-vim

      # Languages
      deoplete-go
      deoplete-nvim
      vim-go
      vim-javascript
      vim-nix
      (pluginGit "evanleck/vim-svelte")

      # Linter
      ale
    ];
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
