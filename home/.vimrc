set nocompatible        " do not emulate vi

call pathogen#infect()  " Enable module loading from bundle folder [vim\bundle\<plugin name>]

" -------------------------------------
" General settings
" -------------------------------------
" keep file system clean
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
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set nojoinspaces
set number
set numberwidth=4
