set bg=dark
syntax on
set autoindent 
set nocompatible
set cindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab
set hidden
set history=1000
set wildmenu
set ignorecase 
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,/tmp
set directory=~/.vim-tmp,/tmp



" Enable incremental search.
set incsearch

" Map a key to unhilight searched-for terms.
map _ :nohls

hi Normal ctermbg=black ctermfg=gray

" Don't beep.
set visualbell

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \ exe "normal! g'\"" |
  \ endif

" Extra mappings
com Wq :wq
nmap <Esc>o :exe "norm o<Bslash><Char-0x3c>Esc>k0".(col('.')-1)."l"<CR>

" Make encryption more secure
setlocal cm=blowfish
autocmd BufReadPre * if system("head -c 9 " . expand("<afile>")) == "VimCrypt~" | call SetupEncryption() | endif
function SetupEncryption()
 setlocal noswapfile nobackup nowritebackup viminfo=
endfunction

" Autocomplete
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
