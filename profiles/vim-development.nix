{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	vimNox
	];
	nixpkgs.config.packageOverrides = pkgs : with pkgs; rec {
		my_vim = vim_configurable.customize {
			name = "vim";

			vimrcConfig.customRC = ''
			syntax on
			filetype on
			set expandtab
			set bs=2
			set tabstop=2
			set shiftwidth=2
			set expandtab
			set smarttab
			set autoindent
			set smartindent
			set smartcase
			set ignorecase
			set showcmd
			set showmatch
			set modeline
			set nocompatible
			set encoding=utf-8
			set hlsearch
			set incsearch
			set ruler
			set nojoinspaces
			set shiftround
			set background=dark
			'';

			vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
			vimrcConfig.vam.pluginDictionaries = [
			{ names = [
				"Syntastic"
				"Tagbar"
				"ctrlp"
				"vim-addon-nix"
				"youcompleteme"
				]; }
				];

			};
		};
	}
