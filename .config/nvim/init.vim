call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/wiki.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" lightline
Plug 'itchyny/lightline.vim'

" trouble (fancy LSP errors display)
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

call plug#end()

" Goyo and lime integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" colorscheme
colorscheme tokyonight-storm

" remap escape to work as expected in terminal mode
tnoremap <Esc> <C-\><C-n>

" remap leader to space
let mapleader = " "

" leap plugin configuration
lua require('leap').add_default_mappings()

" ctrl-space configuration
set nocompatible
set hidden
set encoding=utf-8
let g:CtrlSpaceDefaultMappingKey = "<C-p>"

" lightline theme
let g:lightline = {'colorscheme': 'tokyonight'}

" wiki vim configuration
let g:wiki_root = '~/vimwiki'

" workman remap
nnoremap l o
nnoremap o l
nnoremap L O
nnoremap O L
nnoremap j n
nnoremap n j
nnoremap J N
nnoremap N J
nnoremap gn gj
nnoremap gj gn
nnoremap k e
nnoremap e k
nnoremap K E
nnoremap E <nop>
nnoremap gk ge
nnoremap ge gk
nnoremap h y
onoremap h y
nnoremap y h
nnoremap H Y
nnoremap Y H
