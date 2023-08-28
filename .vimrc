" ignore case when /searching
set ignorecase 
" set number
syntax on
set ruler
set mouse=a

" Search as you type.
set incsearch

" things that clutter git
set nobackup
set noswapfile

" ident
set tabstop=4 shiftwidth=4 expandtab

" f10 to go to end of line (so you have 0 and F10)
nmap <F10> $

" clipboard ? 
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" ... to obtain clipboard support install the packages vim-gtk or vim-gnome 
set clipboard=unnamedplus

" colores
" https://github.com/flazz/vim-colorschemes
colorscheme angr

" persistent undo
silent !mkdir -p "$HOME/.vim/undo"
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" :Ex file manager sort order
let g:netrw_sort_by = "time"
let g:netrw_sort_direction = "reverse"

" fzf
" https://dev.to/pbnj/interactive-fuzzy-finding-in-vim-without-plugins-4kkj
" press <leader> + ff or type :Files to open fzf file search 
let mapleader = "," " default leader is \
function! FZF() abort
    let l:tempname = tempname()
    " fzf | awk '{ print $1":1:0" }' > file
    execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
    try
        execute 'cfile ' . l:tempname
        redraw!
    finally
        call delete(l:tempname)
    endtry
endfunction
" :Files
command! -nargs=* Files call FZF()
" \ff
nnoremap <leader>ff :Files<cr>

" Move visually selected lines up or down in visual or normal mode (shift + k or j)
" https://www.youtube.com/watch?v=gNyNm5DsQ88
nnoremap K :m .-2<cr>==
nnoremap J :m .+1<cr>==
vnoremap K :m '<-2<cr>gv=gv
vnoremap J :m '>+1<cr>gv=gv
