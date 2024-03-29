" Allow lines to extend off the side of the screen
set nowrap

" Start scrolling when we're 5 chars from the edge of the screen
set sidescrolloff=5

" Start scrolloing when we're 5 lines from the top/bottom of the screen
set scrolloff=5

" Indicate that a line is wider than the page with a >
set listchars+=precedes:<,extends:>

" Don't bother setting the screen title
set notitle

" Always display the statusbar
set laststatus=2

" Display cursor coordinates
set ruler

" Allow backspace to delete onto the previous line
set backspace=indent,eol,start

" Don't care about case when searching...
set ignorecase

" ...Unless we include capitals
set smartcase

" Indicate that we have a fast terminal
set ttyfast

" Colours for dark backgrounds
set background=dark

" Display line numbers
set number

" Keep the cursor in the same column...
set autoindent

" ...Unless the previous line ended with a brace
set smartindent

" Comment in the same column as the previous row
inoremap # X#

" Always replace all occurences on current line
set gdefault

" Display search matches as you type
set incsearch

" Tab == 4 spaces
set softtabstop=4

" Replace tabs with spaces
set expandtab

" 4 spaces with autoindent and >>
set shiftwidth=4

" Round indents to multiples of shiftwidth
set shiftround

" Highlight partner bracket when typing
set showmatch

" Add <> to bracket highlight list
set matchpairs+=<:>

" When we split, move the cursor to the lower half
set splitbelow

" We don't want to include underscores in words
"set iskeyword=@,48-57,192-255

" Look for tagfile here
set tags=~/.tags

" Status bar is blue
set t_mr=[0;1;37;44m

" Highlight syntax
syntax on

" KEY BINDINGS

" Tab completion of variables
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <S-tab> <c-r>=InsertTabWrapper ("backward")<cr>

map <F4> :! git diff %<CR>

" Make CommandT easy +quick

map <F5> :CommandT<CR>

" Exit if taglist is last window
let Tlist_Exit_OnlyWindow = 1

" Only show tags for this file
let Tlist_Show_One_File = 1

" Don't bother showing a fold column
let Tlist_Enable_Fold_Column = 0

" Close taglist on select
let Tlist_Close_On_Select = 1

" Don't show cruft
let Tlist_Compact_Format = 1

" Give it focus when we open
let Tlist_GainFocus_On_ToggleOpen = 1

" Make window as wide as necessary
let Tlist_Inc_Winwidth = 1

" Toggle search highlighting
map <silent> <F11> :set hlsearch!<CR>

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

autocmd BufReadPost *.tt set syntax=html

function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
