" Vim configuration file "

" Keymaps "
inoremap jj <ESC>
nnoremap te :tabedit
set clipboard=unnamed

" enable mouse support "
" set mouse=a "

" enable line numbers "
set number 

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Tab indentation "
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set textwidth   =119
set expandtab
set autoindent

" show matching pairs of [] {} and () "
set showmatch

" enable true colors "
set termguicolors

" highlight current line "
set cursorline

" don't have to scroll all the way "
set scrolloff=10

" Update time for better gitgutter "
set updatetime=100

" Vim colorscheme "
syntax enable
set background=dark
colorscheme NeoSolarized

" Transparency matches iTerm2 "
hi Normal guibg=NONE ctermbg=NONE

