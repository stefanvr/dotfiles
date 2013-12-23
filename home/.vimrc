set nocompatible        " do not emulate vi

call pathogen#infect()  " Enable module loading from bundle folder [vim\bundle\<plugin name>]

" -------------------------------------
" General settings
" -------------------------------------
let mapleader=","
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
set encoding=utf-8
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
" Mark tabs and with spaces
set list
set listchars=tab:\▸\ ,trail:·,eol:¬
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`¬

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
  filetype plugin indent on

  " Basic text files
  autocmd FileType text,markdown setlocal wrap linebreak nolist textwidth=80

  " Web related
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufWritePre,FileWritePre *.html,*.css,*.js,*.coffee call StripTrailingWhitespace()

  autocmd FileType html,xhtml setlocal wrap linebreak nolist

  " Ruby related
  autocmd BufNewFile,BufRead {Gemfile,Guardfile,Capfile,Rakefile,Thorfile,config.ru,Vagrantfile,*.prawn} set ft=ruby
  autocmd BufNewFile,BufRead Gemfile.lock,Procfile set ft=yaml
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufNewFile,BufRead *_spec.rb set ft=rspec.ruby

  autocmd BufWritePre,FileWritePre *.rake,*.haml,*.rb,*.erb,*.scss,*.css call StripTrailingWhitespace()

  autocmd Filetype coffee,ruby,yaml,rake,rb,ru setlocal ts=2 sw=2 expandtab
  autocmd FileType html,xhtml,eruby setlocal wrap linebreak nolist

  " Misc structured files
  autocmd BufWritePre,FileWritePre *.xml call StripTrailingWhitespace()

endif

" -------------------------------------
" Shortcuts
" -------------------------------------
nmap <leader>y :.w !pbcopy<CR>
nmap <leader>p :r !pbpaste<CR> "Paste clipboard content to current line
