set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

command Sc SyntasticToggleMode

vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <F5> :!build.bat<cr>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

let g:SingleCompile_split = 'vsplit'

execute pathogen#infect()
syntax on
filetype plugin indent on

set nobackup
set backupdir=C:\Windows\Temp
set noswapfile

set number	
set linebreak	
set showbreak=+++ 	
set textwidth=100	
set showmatch	
set spell

set autochdir
 
set hlsearch	
set smartcase	
set ignorecase	
set incsearch

set guifont=Droid\ Sans\ Mono:h10	
 
set autoindent	
set shiftwidth=4	

set smarttab	
set softtabstop=4	
 
set ruler	
 
set undolevels=1000
set backspace=indent,eol,start
colorscheme gruvbox

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  
endfunction

