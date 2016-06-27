set ts=4 sw=4 sm ai et
syn on
set bg=dark
set tags=./tags
set pastetoggle=<F9>

set foldlevel=0
set foldopen=
set foldclose=all
set foldmethod=marker
set foldmarker=/*,*/

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost \n    \ if line("'\"") > 0 &mp;&mp; line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType xml source ~/.vim/xml.vim
  autocmd FileType xsl source ~/.vim/xml.vim
  autocmd FileType ant source ~/.vim/xml.vim
endif " has("autocmd")

syntax enable
set background=dark
colorscheme solarized
