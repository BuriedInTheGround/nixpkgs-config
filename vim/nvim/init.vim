" Colors {{{
syntax on
let g:airline_theme='nord'
let g:nord_cursor_line_number_background=1
let g:nord_italic=1
let g:nord_italic_comments=1
let $BAT_THEME = 'ansi-dark'
colorscheme nord

" Enable 24-bit RGB, Set Opaque Background
set termguicolors

" Monokai Mode (Dark)
function! ColorMonokai()
    syntax on
    let g:airline_theme = 'molokai'
    let g:monokai_term_italic=1
    let $BAT_THEME = 'Monokai Extended'
    colorscheme monokai
endfunction

" Nord Mode (Dark)
function! ColorNord()
    syntax on
    let g:airline_theme='nord'
    let g:nord_cursor_line_number_background=1
    let g:nord_italic=1
    let g:nord_italic_comments=1
    let $BAT_THEME = 'ansi-dark'
    colorscheme nord
endfunction

" Interrato Mode (Light)
function! ColorInterrato()
    syntax off
    let g:airline_theme = 'papercolor'
    let $BAT_THEME = 'GitHub'
    colorscheme interrato
endfunction

function! ChangeSyntaxHighlighting()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction
" }}}

" Other Configurations {{{
set autowrite
set tabstop=4 softtabstop=0 shiftwidth=4 expandtab smarttab
set encoding=utf-8
set splitright
set omnifunc=syntaxcomplete#Complete  " Http://vim.wikia.com/wiki/Omni_completion
" }}}

" UI {{{
set cursorline

" Turn Hybrid Line Numbers ON
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Dynamically Toggle smartcase
" -> Off when in a : command line
" -> On  when in a / command line
set ignorecase smartcase
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter * set nosmartcase
    autocmd CmdLineLeave * set smartcase
augroup END
" }}}

" Section Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <Space> za
" }}}

" Plugin Configurations {{{
" Deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_autosave=1
let g:go_fmt_command='goimports'
let g:go_imports_mode='gopls'

" fzf-vim
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'Type'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Character'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" }}}

" Filetype-Specific {{{
" Svelte (treat `*.svelte` files as HTML)
au! BufNewFile,BufRead *.svelte set ft=html

" Go (apply Interrato colorscheme)
au! BufNewFile,BufRead *.go call ColorInterrato() | AirlineRefresh | doautocmd BufEnter
" }}}

" Custom Mappings {{{
" Change Theme
nnoremap <leader>e1 :call ColorMonokai()<CR>
nnoremap <leader>e2 :call ColorNord()<CR>
nnoremap <leader>e3 :call ColorInterrato()<CR>

" Turn Syntax ON/OFF
nnoremap <leader>sh :call ChangeSyntaxHighlighting()<CR>

" Clear Search Result Highlight
nnoremap ,<Space> :nohlsearch<CR>

" Split Navigation Mappings
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Avoid Stupid Typos
command! W :w
command! Q :q
command! WQ :wq
command! Wq :wq

" Autocomplete with ctrl-space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
