call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/wiki.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" lightline
Plug 'itchyny/lightline.vim'

" git plugin
Plug 'tpope/vim-fugitive'

" trouble (fancy LSP errors display)
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Prime for the win, let's use harpoon
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

" Treesitter - better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'elixir-editors/vim-elixir'

" Telescope, as a replacement for crtl-p
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

" relative line numbers
syntax on
set relativenumber

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

" lightline theme
let g:lightline = {'colorscheme': 'tokyonight'}

" wiki vim configuration
let g:wiki_root = '~/vimwiki'

" coc stuff
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" vim fugitive stuff
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gc :Git commit -v<cr>
nmap <leader>ga :Git add -p<cr>
nmap <leader>gm :Git commit --amend<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gd :Git diff<cr>
nmap <leader>gw :Gwrite<cr>

" mix stuff
nmap <leader>mtf :!mix test %<cr>
nmap <leader>mt :!mix test<cr>
nmap <leader>ci :!ci<cr>

" harpoon keybindings
nmap <leader>hn <cmd>lua require("harpoon.ui").nav_next()<cr>
nmap <leader>he <cmd>lua require("harpoon.ui").nav_next()<cr>
nmap <leader>ha <cmd>lua require("harpoon.mark").add_file()<cr>
nmap <leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

" window navigation
nmap <leader>wy <C-w>h<cr>
nmap <leader>wo <C-w>l<cr>
nmap <leader>wy <C-w>j<cr>
nmap <leader>we <C-w>k<cr>
nmap <leader>bd :bd<cr>
nmap <leader>vs :vs<cr>


" telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
require('nvim-treesitter.configs').setup {
	ensure_installed = {"c", "javascript", "typescript", "cpp", "elixir"}
}
EOF

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
