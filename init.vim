set nocompatible
filetype off

" ========================== Plug-in manager for Vim. ==========================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nvie/vim-flake8'                      " Runs python file through Flake8, a static syntax and style checker. use F7 in vim
Plugin 'scrooloose/syntastic'                 " Syntax checking hacks for vim
Plugin 'scrooloose/nerdtree'                  " Use: 'Ctrl+\' A tree explorer plugin for vim.
Plugin 'tpope/vim-commentary'                 " Use: gcc to comment line. gc to comment. comment stuff out
Plugin 'tpope/vim-repeat'                     " repeat.vim: enable repeating supported plugin maps with '.'
Plugin 'bling/vim-airline'                    " lean & mean status/tabline for vim that's light as air
Plugin 'jeetsukumaran/vim-buffergator'        " Vim plugin to list, select and switch between buffers.
Plugin 'mbbill/undotree'                      " Use: F5/u/ctrl+r/ The ultimate undo history visualizer for VIM
Plugin 'othree/html5.vim'                     " HTML5 omnicomplete and syntax
Plugin 'tmatilai/vim-monit'                   " Vim syntax highlight for Monit
Plugin 'ervandew/supertab'                    " Perform all your vim insert mode completions with Tab
Plugin 'Matt-Deacalion/vim-systemd-syntax'    " Syntax highlighting for systemd service files in Vim.
Plugin 'fatih/vim-go'                         " Go development plugin for Vim
Plugin 'wting/rust.vim'                       " Vim support for Rust file detection and syntax highlighting.
Plugin '2072/PHP-Indenting-for-VIm'           " The official VIm indent script for PHP
Plugin 'elzr/vim-json'                        " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plugin 'pangloss/vim-javascript'              " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'moll/vim-node'                        " Tools and environment to make Vim superb for developing with Node.js. Like Rails.vim for Node.
Plugin 'xolox/vim-misc'                       " Miscellaneous auto-load Vim scripts
Plugin 'Valloric/MatchTagAlways'              " A Vim plugin that always highlights the enclosing html/xml tags
Plugin 'plasticboy/vim-markdown'              " Markdown Vim Mode
Plugin 'vim-ruby/vim-ruby'                    " Vim/Ruby Configuration Files
Plugin 'stephpy/vim-yaml'                     " Override vim syntax for yaml files
Plugin 'chrisbra/csv.vim'                     " A Filetype plugin for csv files
Plugin 'ekalinin/Dockerfile.vim'              " Vim syntax file & snippets for Docker's Dockerfile
Plugin 'lambdalisue/suda.vim'                 " suda is a plugin to read or write files with sudo command.
call vundle#end()

syntax on
filetype on
filetype plugin indent on
filetype plugin on

let mapleader=","
imap <S-Space> <Esc>
set shell=/bin/bash
set title
set guioptions=T
set guifont=DejaVu\ Sans\ Mono\ 10
set history=500                               " Sets how many lines of history VIM has to remember
set backspace=eol,start,indent                " Configure backspace so it acts as it should act
set wildmenu                                  " enhanced command completion
set visualbell

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw
set complete-=i
set cursorline
set hidden
set nofoldenable
set encoding=utf-8
set nowrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" set autoindent
" set smartindent
" set softtabstop=4
" set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme elflord
set background=dark

set ttimeout
set ttimeoutlen=100
set laststatus=2
set ruler
set showcmd
set display+=lastline
set autoread
set fileformats+=mac

" ======= Settings for scrooloose/syntastic =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:easytags_async = 1

" Enable omni completion. Ctrl-X Ctrl-O
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_exec='~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

au BufRead,BufNewFile {Vagrantfile,Gemfile,Capfile} set ft=ruby

" autocmd FileType ruby compiler ruby

" au FileType ruby setl sw=2 sts=2 et
" au FileType javascript setl sw=2 sts=2 et
" au FileType yaml setl sw=2 sts=2 et

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" Started from here - http://jeetworks.org/vim-making-those-arrow-keys-work-for-you-or-why-the-anti-arrow-key-propoganda-is-wrong/

function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! SetArrowKeysAsTextShifters()
    " normal mode
    nmap <silent> <Left> <<
    nmap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

    " visual mode
    vmap <silent> <Left> <
    vmap <silent> <Right> >
    vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv

    " insert mode
    imap <silent> <Left> <C-D>
    imap <silent> <Right> <C-T>
    inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
    inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
    inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
    inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

    " disable modified versions we are not using
    nnoremap  <S-Up>     <NOP>
    nnoremap  <S-Down>   <NOP>
    nnoremap  <S-Left>   <NOP>
    nnoremap  <S-Right>  <NOP>
    vnoremap  <S-Up>     <NOP>
    vnoremap  <S-Down>   <NOP>
    vnoremap  <S-Left>   <NOP>
    vnoremap  <S-Right>  <NOP>
    inoremap  <S-Up>     <NOP>
    inoremap  <S-Down>   <NOP>
    inoremap  <S-Left>   <NOP>
    inoremap  <S-Right>  <NOP>
endfunction

call SetArrowKeysAsTextShifters()

let g:suda_smart_edit = 1
