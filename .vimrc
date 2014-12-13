" Compatibility
set nocompatible

" General
set background=dark         " dark background
set hidden
set ttyfast
set nowrap
set textwidth=0             " don't break lines
set nobackup
set nowritebackup
set showmatch               " higlight matching braces
set paste                   " paste text from another window

" Search
set incsearch               " search while typing
set hlsearch                " highlight search
set ignorecase              " case insensitive search
set smartcase               " override ignorecase if uppercase in search string

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2

" Display
set number
set numberwidth=6
set scrolloff=4             " minimal number of screen lines to keep above and below the cursor.

" set relativenumber
set showcmd
set laststatus=2            " always show statusline
set background=dark
set cursorline

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|build$',
  \ 'file': '\.so$\|\.dat$'
  \ }

set t_Co=256
let g:solarized_termcolors=256

" colorscheme badwolf
" let g:badwolf_darkgutter = 1
" let g:badwolf_darkbackground = 0
colorscheme tomorrow2

syntax enable
set complete+=kspell
execute pathogen#infect()
"
map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-from=exclude.list . -e " . expand("<cword>") . " " <bar> cwindow<CR>
nnoremap <F12>c :exe ':silent !chromium-browser %<F12>'<CR>
"
autocmd BufNewFile,BufReadPost *.less setl filetype=less
autocmd BufNewFile,BufReadPost *.md setl filetype=markdown shiftwidth=2 tabstop=2 spell
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.litcoffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost Cakefile setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost javascript setl nocindent shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.tsv setl noexpandtab listchars=eol:$,tab:>- list
autocmd Filetype gitcommit setlocal spell
"
autocmd BufWritePre *.{less,md,coffee,litcoffee,Cakefile,js} :%s/\s\+$//e
" CursorHold : fires after you move the cursor and then let it sit still for updatetime milliseconds. (Default 4 seconds.)
" checktime  : check for changes on disk and prompt you to reload
autocmd CursorHold * checktime      " check for file changes on cursor 'idle'
autocmd WinEnter * checktime        " check for file changes on window enter
