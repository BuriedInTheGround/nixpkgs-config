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

      " Dynamically toggle smartcase
      " -> Off when in a : command line
      " -> On  when in a / command line
      :set ignorecase smartcase
      :augroup dynamic_smartcase
      :  autocmd!
      :  autocmd CmdLineEnter * set nosmartcase
      :  autocmd CmdLineLeave * set smartcase
      :augroup END

      " Some mappings
      nnoremap ,<Space> :nohlsearch<CR>

      " Avoid stupid typos
      command! W :w
      command! Q :q
      command! WQ :wq
      command! Wq :wq

      set omnifunc=syntaxcomplete#Complete  " Http://vim.wikia.com/wiki/Omni_completion

      " Use ctrl-space to autocomplete
      inoremap <C-Space> <C-x><C-o>
      inoremap <C-@> <C-Space>
    '';
    plugins = with pkgs.vimPlugins; [
      # Theming
      nord-vim
      vim-airline
      vim-airline-themes

      # Fuzzy Finder
      {
        plugin = fzf-vim;
        config = ''
          nnoremap <C-p> :Files<CR>
          nnoremap <C-g> :Rg<CR>
        '';
      }

      # Languages
      vim-nix
      {
        plugin = deoplete-nvim;
        config = ''
          let g:deoplete#enable_at_startup = 1
        '';
      }
      {
        plugin = deoplete-go;
        config = ''
          let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
          let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
        '';
      }
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

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
