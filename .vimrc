set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-wheel'
Plugin 'SirVer/Ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin on
" Easier split navigations
"nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Vimroom Toggle
nnoremap <silent> <Leader>mz <Plug>VimroomToggle
syntax enable
set splitbelow
set splitright

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Start vim-pencil automatically for certain filetypes
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap':'soft'})
augroup END
let g:goyo_width=80
" Start Goyo on markdown files
au Filetype markdown Goyo 74

" vim-pencil textwidth
"let g:pencil#textwidth = 74

" Enable spellchecking for Markdown
"autocmd FileType markdown setlocal spell
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set ai

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·
set ic
set mouse=a " allow mouse usage
set cmdheight=2 " Set command window height to 2 lines
set confirm " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files
set visualbell " Use visual bell instead of beeping when doing something wrong


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Display filenames
set laststatus=2

set number
set wildmenu
set lazyredraw
set foldenable
set foldlevelstart=4
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" vim-airline customizations
let g:airline_theme='solarized'
"let g:airline#extensions#tabline#enabled=1
"let g:airline_powerline_fonts = 1
" NERDTree autoload
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Set foldmethod 
set foldmethod=syntax
" colorscheme
"set background=light
colorscheme solarized
set cursorline
let g:vim_markdown_math=1 " LaTeX enabled
let g:vim_markdown_frontmatter=1 " Highlight YAML frontmatter
hi Conceal ctermbg=NONE ctermfg=black 
let g:pencil#conceallevel = 3     " 0=disable, 1=onechar, 2=hidechar, 3=hideall (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
let g:tex_conceal='adgm'
"autocmd FileType markdown |
"      \hi def link markdownItalic              NONE |
"      \hi def link markdownItalicDelimiter     NONE |
let g:livepreview_previewer = 'open -a Skim'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
