call plug#begin()
Plug 'Rigellute/rigel'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
"Plug 'mhartington/oceanic-next'
Plug 'erietz/vim-terminator', {'branch': 'main'}
Plug 'Yggdroot/indentLine'
Plug 'csexton/trailertrash.vim'
Plug 'preservim/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'lervag/vimtex'
Plug 'skywind3000/asyncrun.vim'
Plug 'github/copilot.vim'

call plug#end()

set clipboard+=unnamedplus

"let mapleader=","
noremap <Space> <Nop>
map <Space> <Leader>

"leader + R + F  -> run python file

nnoremap <leader>s :wq<enter>
nnoremap <leader>q :q!<enter>
nnoremap <leader><space> :nohlsearch<enter>

nnoremap <leader>p :AsyncRun latexmk -pvc -pdf %<enter>

"change split fraction
noremap <silent> <C-S-right> :vertical resize +1<CR>
noremap <silent> <C-S-left> :vertical resize -1<CR>

"move in split screen
nnoremap <leader>j <C-w>h
nnoremap <leader>k <C-w>l

"run python script in new window
nnoremap <leader>w :w<CR>:!gnome-terminal -- bash -c 'python3 %; exec bash'<CR>
"run python script in vim terminal
"nnoremap <leader>w :w<CR>:terminal python3 %<CR>

let g:terminator_split_fraction = 0.45
let g:terminator_split_location = 'vertical botright'
"when horicontal splitting only
let g:terminator_auto_shrink_output = 1

"change cursor insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"run python script
"nnoremap <leader>r :%w !python<enter>

syntax on
filetype plugin indent on
"set hlsearch
set mouse=a
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set autoindent
set smartindent
set expandtab
set number relativenumber
set nu rnu
set showmatch
set autoindent
set scrolloff=8

"show tab bars
let g:indentLine_char_list = ['▏', '▏', '▏', '▏']
" for vim 8
if (has("termguicolors"))
    set termguicolors
endif


" Aktiviert Copilot beim Start von Vim
autocmd VimEnter * Copilot enable


"TokyoNight Scheme START
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
"TokyoNight Scheme END

colorscheme tokyonight

" NERDTree: reasonable defaults from webinstall.dev/vim-nerdtree
"source ~/.vim/plugins/nerdtree.vim
