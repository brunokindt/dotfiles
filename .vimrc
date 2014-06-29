set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set number
set numberwidth=6
set relativenumber
set nowrap
set textwidth=120
set showmatch               " higlight matching braces
set incsearch
set showcmd
set nobackup
set nowritebackup
set cursorline
set background=dark
set hidden

set t_Co=256
let g:solarized_termcolors=256

colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_darkbackground = 1

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
autocmd BufNewFile,BufReadPost javascript setl nocindent shiftwidth=2 tabstop=2 autoindent
autocmd Filetype gitcommit setlocal spell
"
autocmd BufWritePre * :%s/\s\+$//e
" CursorHold : fires after you move the cursor and then let it sit still for updatetime milliseconds. (Default 4 seconds.)
" checktime  : check for changes on disk and prompt you to reload
autocmd CursorHold * checktime      " check for file changes on cursor 'idle'
autocmd WinEnter * checktime        " check for file changes on window enter
