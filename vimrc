"The GUI setting
"set lines=50 columns=190
"set guifont=courier_new:h12

"Common setting
"set nocompatible
set bs=indent,eol,start
filetype plugin on
filetype indent on

syntax on

set ruler

"set cursorline

set encoding=utf-8
set hlsearch
set incsearch
set ignorecase

set runtimepath+=~/.vim
set autoindent
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set relativenumber
hi LineNr ctermfg=green guifg=darkgreen

set completeopt-=preview

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Yggdroot/indentLine'
"call vundle#end()            " required
filetype plugin indent on    " required

"Set the color of Vertical Split line
hi VertSplit ctermfg=Black ctermbg=Red

"Set status line
set statusline=\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [TYPE=%2*%Y%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]\
hi User1 ctermfg=Cyan ctermbg=Black cterm=underline
hi User2 ctermfg=red ctermbg=Black cterm=underline
hi User3 ctermfg=Magenta ctermbg=Black cterm=underline
hi StatusLine ctermfg=Red ctermbg=Black cterm=underline
hi StatusLineNC ctermfg=Red ctermbg=Black cterm=bold

"Set the tab configuration
"Beautify the tabline
"map the ' key to gt
function! Tabline()
    let s = ''
    for i in range(tabpagenr('$'))
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")

        let s .= '%' . tab . 'T'
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . tab .':'
        let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

        if bufmodified
            let s .= '[+]'
        endif
    endfor

    let s .= '%#TabLineFill#'
    return s
endfunction
hi TabLine      ctermfg=Black  ctermbg=Cyan     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Cyan     cterm=NONE
hi TabLineSel   ctermfg=Yellow  ctermbg=None  cterm=NONE
set tabline=%!Tabline()
set showtabline=2
noremap ' gt

"Set the NerdTree
map \ :NERDTreeToggle<CR>: set rnu<CR>


"Set Indient
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239

func OpenIpy()
    execute "!tmux split -h 'ipython %'"
    "echo line('.')
endfunc

noremap \r :call OpenIpy()<CR>

call plug#begin('~/.vim/plugged')
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" " Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"
Plug 'Chiel92/vim-autoformat'
Plug 'othree/html5.vim'
call plug#end()

let g:coc_disable_startup_warning = 1
let b:coc_diagnostic_disable = 1
