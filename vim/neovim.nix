{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      set autowrite
      set termguicolors

      set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

      " Colorscheme configuration
      let g:nord_cursor_line_number_background = 1
      let g:nord_italic = 1
      let g:nord_italic_comments = 1
      colorscheme nord

      " Turn hybrid line numbers on
      :set number relativenumber
      :augroup numbertoggle
      :  autocmd!
      :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
      :augroup END
    '';
    plugins = with pkgs.vimPlugins; [
      # Theming
      nord-vim
      vim-airline
      vim-airline-themes

      # Fuzzy Finder
      fzf-vim

      # Languages
      vim-nix
      {
        plugin = vim-go;
        config = ''
          let g:go_def_mode='gopls'
          let g:go_info_mode='gopls'
          let g:go_fmt_autosave=1
          let g:go_fmt_command='goimports'
          let g:go_imports_mode='gopls'
        '';
      }
    ];
  };
}
