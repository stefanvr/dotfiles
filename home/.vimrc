 set nocompatible        " do not emulate vi
set nobackup            " do not keep a backup file

call pathogen#infect()  " Enable module loading from bundle folder [vim\bundle\<plugin name>]

set nu                  " test to see if config is used

" -------------------------------------
" Colors, formatting and syntax highlighting
syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
