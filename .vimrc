set bg=dark
syntax on
set autoindent 
set cindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

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
