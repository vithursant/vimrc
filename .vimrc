set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Anaconda supprot for vim
" Plugin 'cjrh/vim-conda'

" Plugin 'JamshedVesuna/vim-markdown-preview'

" Install Jedi
Plugin 'davidhalter/jedi-vim'

"Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'

Plugin 'timothycrosley/isort'

" Git interface
Plugin 'tpope/vim-fugitive'

" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" Colour Scheme
Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'

" Enable  Code Folding
set foldmethod=indent
set foldlevel=99

" Syntax checking
Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'

" All of your plugins must be added before this line
call vundle#end()
filetype plugin indent on    " enables filetype detection

let g:SuperTabDefaultCompletionType = "context"

let g:SimpylFold_docstring_preview = 1

"autocomplete
"let g:ycm_autoclose_preview_window_after_completion=1

""custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinition<CR>
"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" let g:jedi#force_py_version = 2
" let g:UltisnipsUsePythonVersion = 2

" let g:conda_startup_msg_suppress = 1

" No swap files
set noswapfile

" Grip for github flavoured markdown preview
" let vim_markdown_preview_github=1

" Map preview hotkey
" let vim_markdown_preview_hotkey='<C-m>'

" Live Preview Google Chrome
" let vim_markdown_preview_browser='Google Chrome'

"turn on numbering
set nu

"----------------------Start Python PEP 8 stuff---------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent

"use space to open folds
nnoremap <space> za

autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

