" Ignore F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Syntax
syntax on
filetype plugin indent on

" Tab
set tabstop=2
set shiftwidth=2
set expandtab

" Disable continue comment 
set formatoptions-=cro

" Smartcase
set ignorecase
set smartcase

" Line number
set nu
set rnu

" Disable search highlight with double ESC
nnoremap <esc><esc> :silent! nohls<cr>

" Set Leader to Space
let mapleader = "\<Space>"

" Reload vimrc
nnoremap <leader>rv :source<Space>$HOME/.config/nvim/init.vim<cr>

" Temporary disable linenumber
nnoremap <leader>l :set nornu<cr> :set nonu<cr>

" Tab
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>k :tabnext<cr>
nnoremap <leader>j :tabprev<cr>

" Windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Save and exit key mapping
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q!<cr>

" Disable match paren
let g:loaded_matchparen=1

" Plugged
call plug#begin('~/.vim/plugged')
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'ayu-theme/ayu-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'easymotion/vim-easymotion'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'prettier/vim-prettier', {
        \ 'do': 'npm install',
        \ 'branch': 'release/1.x' }
  Plug 'preservim/nerdcommenter'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'rust-lang/rust.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  Plug 'kana/vim-arpeggio'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/vim-peekaboo'
  Plug 'lilydjwg/colorizer'
  Plug 'arcticicestudio/nord-vim'
  Plug 'honza/vim-snippets'
call plug#end()

" EasyMotion
nmap <leader>; <Plug>(easymotion-s2)

" Nerd Commenter
map <C-_> <plug>NERDCommenterToggle

" Fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-o> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg! 

" Prettier
let g:prettier#autoformat = 0
let g:prettier#config#single_quote = 'false'

" Arpeggio
call arpeggio#map('i', '', 0, 'fn', 'function')
call arpeggio#map('i', '', 0, 'rn', 'return')
call arpeggio#map('i', '', 0, 'mt', 'import')

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CoC
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Mouse
set mouse=a

" Theme
set termguicolors
colorscheme nord
