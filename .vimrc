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
set colorcolumn=80          "

" set relativenumber
set showcmd
set laststatus=2            " always show statusline
set background=dark
set cursorline

set noswapfile

" spell-checking
":setlocal spell spelllang=en_us

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|^build$\|dist$\|.tmp$\|coverage$\|platforms$\|_boiler$\|platforms$\|plugins$\|bower_components$\|dst$',
  \ 'file': '\.so$\|\.dat$\|.swp$'
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

set t_Co=256
let g:solarized_termcolors=256

" jshint2
let jshint2_save = 1

" vim-javascript bundle

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

"colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_darkbackground = 1
"colorscheme tomorrow2
colorscheme badwolf

syntax enable
set complete+=kspell
execute pathogen#infect()
"
map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-from=exclude.list . -e " . expand("<cword>") . " " <bar> cwindow<CR>
nnoremap <F12>c :exe ':silent !chromium-browser %<F12>'<CR>
"
autocmd BufNewFile,BufReadPost *.less setl filetype=less
autocmd BufNewFile,BufReadPost *.md setl filetype=markdown shiftwidth=2 tabstop=2 spell textwidth=72 colorcolumn=72 wrap linebreak
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.litcoffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost Cakefile setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost javascript setl nocindent shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.tsv setl noexpandtab listchars=eol:$,tab:>- list
autocmd Filetype gitcommit setlocal spell textwidth=72 colorcolumn=72
"
autocmd BufWritePre *.{less,md,coffee,litcoffee,Cakefile,js} :%s/\s\+$//e
" CursorHold : fires after you move the cursor and then let it sit still for updatetime milliseconds. (Default 4 seconds.)
" checktime  : check for changes on disk and prompt you to reload
" autocmd CursorHold * checktime      " check for file changes on cursor 'idle'
" autocmd WinEnter * checktime        " check for file changes on window enter
