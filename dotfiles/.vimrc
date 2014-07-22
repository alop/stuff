set ruler
set expandtab
set smarttab
set ai sw=2 sts=2 et
set si
set hlsearch
set ignorecase
set smartcase
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>
syntax enable
autocmd FileType ruby, set ai sw=2 sts=2 et
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
