{ config, pkgs, ... }:

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
      vim-nix
    ];
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
