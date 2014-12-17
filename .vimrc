" Use ViM instead of Vi
set nocompatible

" Enhance command-line completion
set wildmenu

" UTF8 as Default
set termencoding=utf-8
set encoding=utf-8

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"	set undodir=~/.vim/undo
"endif

" Syntax Highlighting
syntax on

" Line No
set number

" Show Matching Parenthesis
set showmatch

" Current Line
set cursorline

" Enable mouse in all modes
set mouse=a

" Tab Width as 4 Spaces
set tabstop=4

" Highlight Searches
set hlsearch

" Case-Insensitive Search if All are LowerCase
set smartcase

" Increment Highlight Search
set incsearch

" FileName on TitleBar
set title

" Show Partial Commands
set showcmd

" Print Margin
set colorcolumn=80

" Keep 4 Scrolls at the End
set scrolloff=4

" More History/Undo Levels
set history=1000
set undolevels=1000

" ==== NERDTree ====

" Toggle with ^n
map <C-n> :NERDTreeToggle<CR>

" Close vim if last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==== NERDTree ====

" ==== AirLine ====

" Show by default
set laststatus=2

" ==== AirLine ====
