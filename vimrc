" mkdir -p ~/.vim/bundle
"
" cd ~/.vim/bundle
"
" git clone https://github.com/VundleVim/Vundle.vim.git
"
" # Copy this config file to ~
" # Open vi
" # Enter :PluginInstall
" ===================== Vuldle set up ===========================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Add Nerdtree
Plugin 'scrooloose/nerdtree'
" Add ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
" Add vim-surround
Plugin 'tpope/vim-surround'
" Add syntastic
"Plugin 'scrooloose/syntastic'
" Add snippets
Plugin 'honza/vim-snippets'
" Add tccomment
Plugin 'tomtom/tcomment_vim'
" Add indentLine
Plugin 'Yggdroot/indentLine'
" Add auto delimitmate
Plugin 'raimondi/delimitmate'
" Add easy motion
Plugin 'easymotion/vim-easymotion'
" Add nerdtree-tab
Bundle 'jistr/vim-nerdtree-tabs'
" Add conqueGDB
Plugin 'Conque-GDB'
" Add Tabular
Plugin 'godlygeek/tabular'
" " Add vim airline
Plugin 'bling/vim-airline'
" " Add vim airline theme
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"  set other files.
" ======================= General setups =======================
filetype plugin indent on
syntax on
" colorscheme peachpuff
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set laststatus=2
set scrolloff=5
set hlsearch
set autoread
set mouse=n
set ttymouse=xterm2
set formatoptions-=cro
let mapleader=","
nnoremap <C-L> gt
nnoremap <C-H> gT
map <C-K> <C-Y>
map <C-J> <C-E>
" map <Tab> <C-W><C-W>
inoremap <Tab> <C-P>
vnoremap // y/<C-R>"<CR>
map gm :call cursor(0,virtcol('$')/2)<CR>
set tabpagemax=50
" F2 for window manipulation
nnoremap <F2> <C-W>
nnoremap <F2><F2> <C-W><C-W>
" F3 for generate ctags file
nnoremap <F3> :!ctags --extra=+f -R .<CR>
" F4 for close current window
imap <F4> <Esc>:q!<CR>
nmap <F4> :q!<CR>
" F5 for saving current window
imap <F5> <Esc>:w<CR>
imap <F5><F5> <Esc>:wa<CR>
nmap <F5> <Esc><Esc>:w<CR>
nmap <F5><F5> <Esc><Esc>:wa<CR>
" F6 nothing
" F7 for debug
" F8 for open tagbar but may need to delete it
" nmap <F8> zi
" F9 for make file
nmap <F9> :make \| cwindow<CR>
map <C-]> g<C-]>

" =============== Buffer mapping =============
nmap gb :buffers<CR>:buffer<Space>
map <C-N> :bnext<CR>
" Use <C-O> to back
" Reverse of <C-o> is <C-i>


" =============== Set Nerttree =============
let g:NERDTreeWinSize = 20
map qq :NERDTreeTabsToggle<CR>

" =============== Set ConqueGdb =============
let g:ConqueGdb_SrcSplit = 'left'
nmap <F7> :ConqueGdbVSplit<CR>

" ============== Vim-airline configure ===================
set t_Co=256
let g:airline_theme='term'
let g:airline_inactive_collapse=0

" =============== Set the Tab file name pattern ==============
set tabline=%!MyTabLine()

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T' 

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1 
        let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let label =  bufname(buflist[winnr - 1]) 
    return fnamemodify(label, ":t") 
endfunction

" ============= Configure man page ===============
runtime! ftplugin/man.vim
map K :Man <cword><CR><C-W>r<CR>

" ============= Configure fold options ===============
set foldmethod=indent
set foldlevelstart=20
hi Folded guibg=NONE ctermbg=None
" Open one fold under current cursor
nnoremap <CR> za

" ============== Configure tabular ===================
nmap <Leader>a :Tabularize /
vmap <Leader>a :Tabularize /

" ================ Set currentline =========================
set cursorline
highlight CursorLine cterm=None ctermbg=234
hi Search cterm=underline ctermfg=black ctermbg=yellow
hi Visual  cterm=NONE ctermbg=237


" ================ Set move cursor in  insert mode =========================
imap <C-h> <C-o>h
imap <C-l> <C-o>l
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-space> <Esc>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0






" ============== Command notes ===================
" ## Open file under cursor
" gf      : go to the first file (Only system files such as stdio.h)
" <c-w>f  : open file in a new window.
" <c-w>gf : open file in a new tab.
" 2gf     : go the second file matching
" K       : find man page of function under current cursor.
"
"
" ## Using ctags jump in vim
" ctrl-] : jump to tag under current cursor(usually a word)
" ctrl-t : jump back the tag
" ctrl-o : jump back the buffer
"
" ## Folding codes
" ### Manually create folder
"     - zf#j --> create folder down # lines
"     - zf#k --> create folder up # lines
"     - use visual mode
"
"     - zfa} or zfa{ ---> create folder all {}
"     - zfi{ or zfi{ ---> create folder in {}
"     - zf/string ---> create folder until string
"
"     - za -------> Toggle one folder at the cursor
"     - zA -------> OpeTogglel folder at the cursor
"     - zm -------> Close all folder at the cursor
"     - zM -------> Close all open folders
"     - zR -------> Close all folder at the cursor
"     - zo -------> Open one folder at the cursor
"     - zO -------> Open all folder at the cursor
