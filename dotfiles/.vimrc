execute pathogen#infect()
let loaded_netrwPlugin = 1
vnoremap <C-c> "*y
set clipboard=unnamedplus
set mouse=a
set selectmode=mouse
syntax on
set encoding=utf-8
set t_Co=256
let &t_Co=256
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['python', 'json', 'ruby'] }
let g:syntastic_enable_balloons = 1
set autoread
set ruler
"set paste
set hlsearch
set ignorecase
set smartcase
set ai si et sw=2 sts=2
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>
augroup myfiletypes
" Clear old autocmds in group
autocmd!
autocmd FileType ruby, set ai sw=2 sts=2 et
autocmd FileType python, set ai sw=4 ts=4 sts=4 et
autocmd FileType go, set ai sw=4 ts=4 sts=4 noet
autocmd FileType sh,bash set ai si sw=4 sts=4 expandtab
autocmd FileType txt set ts=4 sts=4 sw=4 noet
augroup END
    "             "autocmd FileType sh,python,ruby autocmd BufWritePre
    "             <buffer> :%s/\s\+$//e
autocmd Filetype gitcommit setlocal spell textwidth=72

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set background=dark
colorscheme solarized
"filetype indent plugin on
set modeline
" Enable NERDTree only when file not specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Enable NERDTree all the time
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeMouseMode=3
let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
