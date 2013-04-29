" Most of the content of this vimrc file come from 
" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide

" First load all plugins via pathogen
" Note that it is recommended to turn filetype off
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme darkblue
syntax on
filetype on
filetype plugin on
filetype indent on

" Fix space/tab
set shiftwidth=4
set tabstop=4
set expandtab
autocmd FileType make     set noexpandtab " except for Makefile of course

set history=1000
set wildmode=list:longest
set ignorecase
set smartcase
set title
set visualbell
set scrolloff=3
set ruler "display ruler at the bottom
set number "display line number
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Enable case-insentive search
set hlsearch
" Enable incremental search display
set incsearch

" Make CR, trailing spaces and tabs visible
set list
set listchars=tab:>-,trail:·
" Type ',s' to turn off display of whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" Map leader key to ',' instead of '\'
let mapleader = ","

" Replace grep by ack
set grepprg=ack
set grepformat=%f:%l:%m
" ',a PATTERN [DIRECTORY]' instead of ':Ack! ...'
nmap <leader>a <Esc>:Ack!

" Ctrl-n toggles the NERDTree window
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Customize navigation keys between split windows
" Use Ctrl-[h/j/k/l] instead of Ctrl-W [h/j/k/l]
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" ',td' toggles the Task Lists window
map <leader>td <Plug>TaskList
" ',g' toggles the Gundo window
map <leader>g :GundoToggle<CR>
" ',j' will jump to class definition
" ',r' will rename references
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" ',8' will run pep8 on the opened buffer
let g:pep8_map = '<leader>8'

" SuperTab plugin configuration
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" Cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Settings for powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

autocmd Filetype gitcommit setlocal spell textwidth=72
