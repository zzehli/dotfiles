"=====================================
"Editor settings
"=====================================

filetype plugin indent on
set autoindent
set noshowmode "duplicate functionality with status bar plug in"
set tabstop=4
set softtabstop=4 
set shiftwidth=4
"quick access to vimrc
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

"=====================================
"Plug-in with vim-plug
"=====================================

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
" Plug 'junegunn/fzf.vim'
"colorscheme
Plug 'romainl/apprentice'
call plug#end()

" Plugin settings
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ }
"put fzf results on the bottom instead of center
let g:fzf_layout = { 'down': '~40%' }

" ====================================
" GUI settings
" ====================================

set number "absolute line number"
set mouse=a "enable mouse usage in all modes"
colorscheme slate 
