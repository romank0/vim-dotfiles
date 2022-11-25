
set nocompatible              " Don't be compatible with vi
lan en_US

filetype off

" run to install :PluginInstall
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/Mark'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'preservim/nerdtree'
Plugin 'vsushkov/nerdtree-ack'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'romank0/vim-bookmarks'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'will133/vim-dirdiff'
Plugin 'leafgarland/typescript-vim'
Bundle 'yssl/QFEnter'
Plugin 'tpope/vim-dispatch'
"Plugin 'janko-m/vim-test'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'eshion/vim-sync'
Plugin 'alfredodeza/pytest.vim'
Plugin 'fratajczak/one-monokai-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let mapleader=","             " change the leader to be a comma vs slash
let maplocalleader = "\\"

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
set number                  " Display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set background=dark         " We are using dark background in vim
set title                   " show title in console title bar
set wildmenu                " Menu completion in command mode on <Tab>
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " indent level is 4 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set secure
set exrc
set clipboard=unnamed
" colorscheme one-monokai
colorscheme default

set termguicolors
" enable if terminal does not support truecolor
" set t_Co=256

set wildmode=longest,list
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.jar,*.class
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=.git/**
set wildignore+=.idea/**
set wildignore+=.envs/**
set wildignore+=tags

" Folds

set foldcolumn=1
highlight FoldColumn guibg=grey21
highlight Folded guibg=grey21

function! FoldHelp()
    echo "FoldByExpr"
    echo "let &foldexpr='getline(v:lnum)=~''BasicBinder'''"
endfunction

command FoldByExpr :set foldmethod=expr foldexpr foldlevel=0

" set foldmethod=expr foldexpr foldlevel=0
" let &foldexpr='getline(v:lnum)=~''BasicBinder'''


"""" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
"let &stl="%F%m%r%h%w\ [%{&ff}]\ [%Y]\ %P\ %=\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]"
let &stl="%F%m%r%h%w\ [%{&ff}]\ [%Y]\ %P\ %=%{fugitive#statusline()}\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]"

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set diffopt=filler,iwhite   " ignore all whitespace and sync

map <Leader>6 <C-^>
map [op :set paste<CR>
map ]op :set nopaste<CR>

" NERDTree
let g:NERDChristmasTree = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 60
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <Leader>t :NERDTreeToggle <cr>
map <Leader>f :NERDTreeFind <cr>

" Fugitive
map <leader>gs :Git<cr>
map <leader>gw :Git write<cr>
map <leader>gd :Gdiff<cr>
map <leader>gc :Git commit<cr>
map <leader>gb :Git blame<cr>
map <leader>gl :Git log

" Fugitive-Gitlab
let g:fugitive_gitlab_domains = ['https://newrepo.jikotech.com/']

" vim-test
"let test#strategy = "dispatch"
"map <Leader>xt :TestFile<cr>
"map <Leader>xr :TestLast<cr>
"

" pytest
map <Leader>xt :Pytest project verbose<cr>
map <Leader>xn :Pytest next<cr>

" Python
"au BufRead *.py compiler nose
"au FileType python set omnifunc=pythoncomplete#Complete
"au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent cinwords=if,elif,else,for,while,try,except,finally errorformat=%.%#\ at\ %.%#(%f:%l:%c),%-G%.%#
au FileType sh setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au BufRead *.md set filetype=markdown
au BufRead *.cpp,*.c,*.h set cindent
au FileType markdown set tw=79
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
let python_highlight_all = 1
nmap <Leader>st Oimport ipdb; ipdb.set_trace()<Esc>:w<CR>

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorcolumn
	"disabled in favour of term2 cursor guide
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "au WinLeave * setlocal nocursorline
augroup END

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    #execfile(activate_this, dict(__file__=activate_this))
EOF
endif

if exists("&colorcolumn")
    au FileType python set colorcolumn=80
    au FileType markdown set colorcolumn=80
    au FileType java set colorcolumn=121
endif

" jump to last line edited in a given file (based on .viminfo)
autocmd BufReadPost *
                \ if line("'\"") > 0|
                \       if line("'\"") <= line("$")|
                \               exe("norm '\"")|
                \       else|
                \               exe "norm $"|
                \       endif|
                \ endif

" Bookmarks
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_highlight_lines = 1
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear

" Airline
let g:airline#extensions#tabline#enabled = 1

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline_section_y='%P'
let g:airline_section_x=''
let g:airline_section_a=''
let g:airline_section_z='%l/%L,%v'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#filetypes='[]'

if executable('rg')
  set grepprg=rg\ -n\ --no-heading\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_cmd = 'CtrlPLastMode'
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"nnoremap о j
"nnoremap ш i
"nnoremap р h
"nnoremap л k
"nnoremap д l
"nnoremap у e
"nnoremap ц w
"nnoremap н y
"nnoremap нн yy
"nnoremap з p
"nnoremap З P
"nnoremap к r
"nnoremap г u
"nnoremap ф a
"nnoremap с c
"nnoremap м v
"nnoremap и b
"nnoremap ч x
"nnoremap Ш I
"nnoremap Ф A
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
