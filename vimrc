
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
"Plugin 'sansyrox/vim-python-virtualenv'
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'psf/black'
Plugin 'dense-analysis/ale'
Plugin 'mbbill/undotree'
Plugin 'joshbohde/vim-curl'
Plugin 'puremourning/vimspector'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
if !has('nvim') && v:version >= 900
    Plugin 'bfrg/vim-qf-diagnostics'
endif

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
set scrolloff=8
" colorscheme one-monokai
colorscheme default
"colorscheme solarized

set background=dark
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
set wildignore+=tags*

" Folds

" set foldcolumn=1
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
set nobackup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100
set history=10000

if !has('nvim')
  set viminfo+=n~/.viminfo
else
  set viminfo+=n~/.shada
endif

" undo options
set undolevels=10000
if has('persistent_undo')
    if has('nvim')
        set undodir=$HOME/.vimundo-nvim
    else
        set undodir=$HOME/.vimundo
    endif
    set undofile 
endif 
map <Leader>u :UndotreeToggle<CR>

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

map <Leader>d "_d
map <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

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
" let g:black_use_virtualenv = 'true'
" augroup PythonBlack
"    autocmd BufWritePre *.py execute ':Black'
" augroup END
"

function! RuffAll(buffer) abort
  " Use ALE's root if available; fall back to the file's dir
  let l:root = getbufvar(a:buffer, 'ale_root', expand('#'.a:buffer.':p:h'))
  let l:ruff = shellescape(get(g:, 'ale_python_ruff_executable', 'ruff'))
  return {
  \ 'command': 'cd ' . fnameescape(l:root)
  \            . ' && ' . l:ruff . ' check --fix %t'
  \            . ' ; ' . l:ruff . ' format %t',
  \ 'read_temporary_file': 1,
  \}
endfunction

let g:ale_fixers = {'python': [function('RuffAll'), 'trim_whitespace']}

let g:ale_linters = {
\   'python': ['ruff'],
\}

" let g:ale_python_ruff_options = '--select I,F,E,W,C90,N,UP,YTT,S,BLE,B,A,COM,C4,DTZ,ISC,ICN,G,PIE,T20,PYI,PT,Q,RSE,RET,SLF,SIM,TID,ARG,PD,PL,TRY,NPY,RUF'
let g:ale_python_ruff_options = ''
let g:ale_python_ruff_format_options = ''

let g:ale_fix_on_save = 1

nmap [of :let g:ale_fix_on_save = 0<CR>
nmap ]of :let g:ale_fix_on_save = 1<CR>

"au BufRead *.py compiler nose
"au FileType python set omnifunc=pythoncomplete#Complete
"au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
let python_highlight_all = 1
nmap <Leader>sb Obreakpoint()<Esc>:w<CR>

function ConcealPath()
       syntax match ConcealedPath /^\([^|]*|\)\{2,2}/ conceal cchar=↭
       setlocal conceallevel=2
       setlocal concealcursor=nvic
       setlocal nowrap 
endfunction

function UnconcealPath()
       setlocal conceallevel=0
       setlocal wrap
endfunction

nmap <Leader>oqc :copen<CR>:call ConcealPath()<CR>
nmap <Leader>oqu :copen<CR>:call UnconcealPath()<CR>

augroup qf-diagnostics-user
    autocmd!
    autocmd QuickfixCmdPost  make  DiagnosticsPlace
    autocmd QuickfixCmdPost lmake LDiagnosticsPlace
augroup END


au FileType coffee setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent cinwords=if,elif,else,for,while,try,except,finally errorformat=%.%#\ at\ %.%#(%f:%l:%c),%-G%.%#
au FileType sh setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent
au BufRead *.md set filetype=markdown
au BufRead *.cpp,*.c,*.h set cindent
au FileType markdown set tw=79

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorcolumn
	"disabled in favour of term2 cursor guide
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "au WinLeave * setlocal nocursorline
augroup END

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

nmap <Leader>or :set invrnu<CR>

" Add the virtualenv's site-packages to vim path
if has('python')
python << EOF
import os
import subprocess

if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)

EOF
endif

if exists("&colorcolumn")
    au FileType python set colorcolumn=89
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
nmap <Leader>bi <Plug>BookmarkAnnotate
nmap <Leader>ba <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>bk <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear

" Filename
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cfr :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cfa :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>cff :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cfd :let @*=expand("%:p:h")<CR>
endif

" HP42

autocmd BufRead,BufNewFile *.41,*.42 :source ~/.vim/syntax/hp41.vim
autocmd BufRead,BufNewFile *.41,*.42 :source ~/.vim/ftplugin/hp41.vim


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
let g:airline_section_x='chr:%b[0x%B]'
let g:airline_section_a=''
let g:airline_section_z='%l/%L,%v'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#filetypes='[]'

if executable('rg')
  set grepprg=rg\ -n\ --no-heading\ --color=never\ --hidden
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_cmd = 'CtrlPMRUFiles'

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>



function! CallChatGPTAPI(instructions) abort
  let l:API_KEY = $CHAT_GPT_API_KEY
  let l:API_URL = "https://api.openai.com/v1/completions"

  let l:current_selection = getline("'<", "'>")
  let l:prompt = a:instructions . "\n" . join(l:current_selection, "\n")

  let l:headers = {
        \ 'Content-Type': 'application/json',
        \ 'Authorization': 'Bearer ' . l:API_KEY
        \ }

  " let l:response = json_decode(curl#request('POST', l:API_URL, json_encode(l:data), l:headers))
  " let l:result = l:response['choices'][0]['text']

  " let l:response = py3eval("vim.call('ch_open', ['https://api.openai.com/v4/engines/davinci-codex/completions', 'block', {'headers': vim.eval('l:headers'), 'method': 'POST', 'payload': vim.eval('json_encode(l:data)') }])")
  " let l:result = json_decode(l:response)['choices'][0]['text']
  
python3 << EOF
import vim
import json
import http.client
import urllib.parse
from io import StringIO

headers = vim.eval('l:headers')
prompt = vim.eval('l:prompt')
data = json.dumps({
   'model': 'text-davinci-003',
   'prompt': prompt,
   'max_tokens': 300,
   'temperature': 0.5,
}).encode('utf-8')
url = vim.eval('l:API_URL')

parsed_url = urllib.parse.urlparse(url)
ssl = False if parsed_url.scheme == 'http' else True
connection = http.client.HTTPSConnection(parsed_url.netloc) if ssl else http.client.HTTPConnection(parsed_url.netloc)

connection.request('POST', parsed_url.path, body=data, headers=headers)
response = connection.getresponse()
response_text = response.read().decode('utf-8')
response_json = json.loads(response_text)
result = response_json['choices'][0]['text']

vim.command("new")
vim.current.buffer.append(result.split('\n'), 0)
EOF

endfunction

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'


command! -nargs=1 ChatGPT :call CallChatGPTAPI(<q-args>)
