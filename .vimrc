" Download vim-plug if it isn't installed yet.

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'tell-k/vim-autoflake', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/Goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'Townk/vim-autoclose'
Plug 'sbdchd/neoformat'
Plug 'ryanoasis/vim-devicons'
Plug 'bfrg/vim-cpp-modern'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'PontusPersson/pddl.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/applescript.vim'
"Plug 'kovisoft/slimv'
call plug#end()


syntax enable
" set Vim-specific sequences for RGB colors
set termguicolors
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme seoul256

"highlight Comment cterm=italic
set number

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better defaults
set splitbelow splitright
set wrap linebreak nolist
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set ai
set textwidth=79

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.json set foldmethod=indent
autocmd BufRead,BufNewFile *.cpp set foldmethod=syntax
autocmd BufRead,BufNewFile *.ts set filetype=typescript
" Remove trailing whitespace on each write for certain filetypes
autocmd FileType c,cpp,java,php,sh autocmd BufWritePre <buffer> %s/\s\+$//e

set encoding=utf-8

" vim-airline customizations
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Digraphs

"alphsubs ---------------------- {{{
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs js " . 0x2C7C
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
        execute "digraphs Gc " . 0x1D4A2
        execute "digraphs Nc " . 0x1D4A9
"}}}

let g:python_highlight_all = 1
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'stdin': 1,
            \ 'args': ['--line-length', '79', '-', '2>/dev/null'],
            \ }
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:shfmt_opt="-ci -i 4"

let g:neoformat_cs_uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'stdin': 1,
            \ 'args': ['-c', '-', '-q', '-l CS'],
            \ }

" Remapping keys for easier navigation when word wrapping is on
nnoremap j gj
nnoremap k gk
