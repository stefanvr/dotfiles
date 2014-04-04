set nocompatible                        " do not emulate vi

call pathogen#infect()                  " Enable module loading from bundle folder [vim\bundle\<plugin name>]
call pathogen#helptags()                " Make help from plugins available

" -------------------------------------
" General settings
" -------------------------------------
set backspace=2                         " make backspace work like most other apps

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

set wildmenu
set wildmode=longest,full
set wildignore+=tmp,.bundle,.sass-cache,.git,.svn,.hg,doc,coverage
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

" Line number column
set number
set numberwidth=4
nmap <leader>n :set number!<CR>"         " Shortcut to rapidly toggle `set number`
nmap <leader>rn :set rnu!<CR>"           " Shortcut to rapidly toggle between relative and absolute line number

" Status line
nmap <leader>sh :set laststatus=1<CR>"   " Shortcut to hide status line
nmap <leader>ss :set laststatus=2<CR>"   " Shortcut to show status line
let g:airline_powerline_fonts=0
set laststatus=2

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
" Mark tabs and spaces handling
set list
set listchars=tab:\▸\ ,trail:·,eol:¬

nmap <leader>l :set list!<cr>"          " Shortcut to rapidly toggle `set list`
nnoremap <silent> <F5> :call StripTrailingWhitespace()<CR>

function! StripTrailingWhitespace()
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

" -------------------------------------
" File type settings
" -------------------------------------
if has('autocmd')
  filetype plugin indent on

  " Basic text files
  autocmd FileType text,mkd,markdown setlocal wrap linebreak nolist textwidth=80 foldlevel=99

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
" Copy past settings
" -------------------------------------
if has('autocmd')
  autocmd InsertLeave * set nopaste
endif

"vnoremap <leader>c "+y
"nmap <leader>p "+p<CR> "Paste clipboard content to current line

" Moving lines up and down in normal, insert and visual mode
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Optimize navigation and often used commands
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"remap escape 
nnoremap <leader><leader> <c-^>

nnoremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
nnoremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
