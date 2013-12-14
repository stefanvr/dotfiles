set nocompatible        " do not emulate vi

call pathogen#infect()  " Enable module loading from bundle folder [vim\bundle\<plugin name>]

" -------------------------------------
" General settings
" -------------------------------------
" Keep file system clean
set nobackup
set nowritebackup                       " Do not write backup file under certain edge cases
set noswapfile

" Ui performance
set hidden                              " Some column stuff
set autoread
set ttyfast                             " Improves redrawing
set lazyredraw                          " Don't update while in macro

" No anoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" -------------------------------------
" Searching
" -------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" -------------------------------------
" Colors and syntax highlighting
" -------------------------------------
set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" -------------------------------------
" Formatting
" -------------------------------------
set nowrap
set synmaxcol=200                       " Do not highlight long lines
" Tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
" Auto space/tab insert behaviour
set autoindent
set smartindent
set nojoinspaces
" Line number column
set number
set numberwidth=4

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
   let _s=@/
   let l = line(".")
   let c = col(".")
   " Do the business:
   %s/\s\+$//e
   " Clean up: restore previous search history, and cursor position
   let @/=_s
   call cursor(l, c)
endfunction



if has('autocmd')
  autocmd FileType text setlocal wrap linebreak nolist textwidth=80
  autocmd FileType markdown setlocal wrap linebreak nolist textwidth=80
endif
