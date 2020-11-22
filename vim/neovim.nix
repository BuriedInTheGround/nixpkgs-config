{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-go;
	config = ''
	  let g:go_def_mode='gopls'
	  let g:go_info_mode='gopls'
	'';
      }
    ];
  };
}
