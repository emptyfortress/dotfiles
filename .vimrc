" plugins by Vundle ----------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'posva/vim-vue'
" Plugin 'othree/html5.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'idanarye/vim-merginal'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'junegunn/vim-easy-align'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tommcdo/vim-exchange'
" Plugin 'prettier/vim-prettier'
" Plugin 'Rykka/colorv.vim'
Plugin 'mattn/webapi-vim'
Plugin 'soramugi/auto-ctags.vim'
Plugin 'w0rp/ale'
Plugin 'machakann/vim-highlightedyank'
Plugin 'digitaltoad/vim-pug'
Plugin 'vimwiki/vimwiki'
Plugin 'schickling/vim-bufonly'
"Plugin 'dhruvasagar/vim-dotoo'
"Plugin 'neitanod/vim-clevertab.git'
"Plugin 'raimondi/delimitmate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
" Put your non-Plugin stuff after this 

"set encoding, leader and edit vimrc ----------------------------
scriptencoding utf-8
set encoding=utf-8 
:let mapleader = ","
nnoremap <leader>ev :e $HOME/.vimrc<cr>
" nnoremap <leader>sv :source ~/.vimrc<cr>
" 

"airline ----------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#keymap#enabled = '0'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:bufferline_echo = 0
let g:airline_theme='dark'
nnoremap <leader>rr :AirlineRefresh<Cr>
" 

" colors ----------------------------------------
set t_Co=256
" set termguicolors
syntax enable
" syntax on
" filetype plugin on
set background=dark
colorscheme gruvbox
"colorscheme solarized
set guifont=Anonymous\ Pro\ for\ Powerline:h20
" 

"set cursor in insert mode in terminal 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" line numbers and indents  ----------------------------
set cursorline
"hi CursorLine gui=underline
set number
set relativenumber
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
"tabs stops
set list
set listchars=tab:\|\ 
"highlight SpecialKey guifg=#546163
set scrolloff=2
" 

" hilight search - ----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>
" 

" russian keyboard  ----------------------------
set keymap=russian-jcukenwin
set iskeyword=@,48-57,_,192-255
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" 

"keep history in viminfo file and restore cursor postion ----------------------------
set viminfo='10,\"100,:20,%,n~/.viminfo
" set viminfo for neovim
if !has('nvim')
  set viminfo+=n~/.nviminfo
endif
"jump to last known positions
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" 

" folding ----------------------------
set foldenable
set foldmethod=manual
set foldlevelstart=0
au FileType html setlocal foldmethod=indent
" 

"nerdtree  ----------------------------
silent! nmap <F2> ;NERDTreeToggle<CR>
silent! nmap <F3> ;NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
" 

" misc  ----------------------------
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
noremap \ :wa<Cr>
" 


"set key bindings for quick window movement----------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 

" Maintain undo history between sessions
set undofile 
set undodir=~/.vim/undodir

"highlight line and clear hightlight *********************
nnoremap <silent> <Leader>l :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<cr>
nnoremap <silent> <Leader><Space> :call clearmatches()<CR>

set mouse=a "enable mouse in terminal
set wildmenu "set wildmenu
set hidden " buffers
set backspace=2 " make backspace work like most other apps

"easymotion configuration
"nmap s <Plug>(easymotion-s2)
nmap <leader>a <Plug>(easymotion-s2)
"nmap <leader><leader>s <Plug>(easymotion-s2)
nmap <leader>t <Plug>(easymotion-t2)
"nmap <leader><leader>t <Plug>(easymotion-t2)
" Move to line
"map <leader>l <Plug>(easymotion-bd-jk)
"nmap <leader>l <Plug>(easymotion-overwin-line)

"this is for ultisnip *******************************
let g:ultisnipsexpandtrigger="<tab>"
let g:ultisnipsjumpforwardtrigger="<tab>"
let g:ultisnipsjumpbackwardtrigger="<c-b>"
let g:ultisnipseditsplit="vertical"
let g:ultisnipssnippetsdir='~/.vim/ultisnips/'
let g:ultisnipssnippetdirectories=["ultisnips"]
nnoremap <leader>ue :ultisnipsedit<cr>

"Fix for escape delay in terminal ***************************
set timeoutlen=1000 ttimeoutlen=0

"FZF fuzzy finder mapping ********************
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion with fzf ************************
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"my own mappings  *******************
nnoremap <leader>F :Files<Cr>
nnoremap <leader>FF :GFiles?<Cr>
nnoremap <leader>ff :GFiles<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>fl :BLines<Cr>
nnoremap <leader>L :Lines<Cr>
nnoremap <leader>fs :Snippets<Cr>
nnoremap <Leader>' :Marks<CR>
nnoremap <Leader>H :Helptags!<CR>
nnoremap <Leader>C :Commands<CR>
nnoremap <Leader>M :Maps<CR>
nnoremap <Leader>: :History:<CR>
nnoremap <Leader>/ :History/<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"ignore some files swp, ., and others from search ****************
let FZF_DEFAULT_COMMAND='ag -g ""'

"Adding ripgrep for search in files ***********************
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


"set size of the windows *************************
" set winheight=7
" set winminheight=7
" set winheight=999
"resize windows with ease *********************
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
"remap ; : ***************************
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"Autocompletion **************************
set complete=.,b,u,w,t,]
" Keyword list 
set complete+=k~/.vim/keywords.txt


"mapping for autocompleteion ****************************
"inoremap ^] ^X^]
"inoremap ^F ^X^F
"inoremap ^D ^X^D
"inoremap ^L ^X^L
inoremap <c-l> <c-x><c-l>

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l
" set splitbelow
set splitright

"Close a window
nnoremap <silent><leader>q :q<cr>

" Close buffer
noremap <silent><leader>d :bd<cr>
noremap <silent><leader><leader>d :bd!<cr>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"this is for do too (vim gtd system) *******************
"let g:dotoo#agenda#files = ['~/Documents/dotoo-files/*.dotoo']
"let g:dotoo#capture#refile = expand('~/Documents/dotoo-files/refile.dotoo')
"
"
"center cursor while searching and next jumping
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz
"this is one command in insert mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O

"set global options for substitute
set gdefault
set nowrap

"this is easyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  This for search and replace command in command lind  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>f :g//#<Left><Left>

" make list-like commands more intuitive

" function! CCR()
"     let cmdline = getcmdline()
"     if cmdline =~ '\v\C^(ls|files|buffers)'
"         " like :ls but prompts for a buffer command
"         return "\<CR>:b"
"     elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
"         " like :g//# but prompts for a command
"         return "\<CR>:"
"     elseif cmdline =~ '\v\C^(dli|il)'
"         " like :dlist or :ilist but prompts for a count for :djump or :ijump
"         return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
"     elseif cmdline =~ '\v\C^(cli|lli)'
"         " like :clist or :llist but prompts for an error/location number
"         return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
"     elseif cmdline =~ '\C^old'
"         " like :oldfiles but prompts for an old file to edit
"         set nomore
"         return "\<CR>:sil se more|e #<"
"     elseif cmdline =~ '\C^changes'
"         " like :changes but prompts for a change to jump to
"         set nomore
"         return "\<CR>:sil se more|norm! g;\<S-Left>"
"     elseif cmdline =~ '\C^ju'
"         " like :jumps but prompts for a position to jump to
"         set nomore
"         return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
"     elseif cmdline =~ '\C^marks'
"         " like :marks but prompts for a mark to jump to
"         return "\<CR>:norm! `"
"     elseif cmdline =~ '\C^undol'
"         " like :undolist but prompts for a change to undo
"         return "\<CR>:u "
"     else
"         return "\<CR>"
"     endif
" endfunction
" cnoremap <expr> <CR> CCR()


" map '<CR>' in command-line mode to execute the function above
" cnoremap <expr> <CR> CCR()

"""""""""""""""""""""""""""""""
"  clipboard paste in quotes  - stamp class in quotes "
"""""""""""""""""""""""""""""""
" set clipboard=unnamed
nnoremap S di""0P

" runtime macros/matchit.vim
" packadd! matchit


" open help in vertical split
cabbrev h vert bo h
abbrev brd border: 1px solid red;

""""""""""""""""""""""""""""
"  navigate in help files  "
""""""""""""""""""""""""""""
noremap <silent> <right>  :cnext<cr>
noremap <silent> <right><right>  :cnfile<cr><C-G>
noremap <silent> <left>  :cprev<cr>
noremap <silent> <left><left>  :cpfile<cr><C-G>



"""""""""""
"  ctags  "
"""""""""""
" let g:auto_ctags = 1

"""""""""""""""""""""""
"  es lint ale fixer  "
"""""""""""""""""""""""
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" disabe linter for specific files
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   'vis.js$': {'ale_enabled': 0},
\}

nmap <silent> <leader>3 <Plug>(ale_previous)
nmap <silent> <leader>4 <Plug>(ale_next)
nmap <silent> <leader>fix <Plug>(ale_fix)

" hightlight matching brackets
"hi MatchParen cterm=none ctermbg=yellow ctermfg=red
hi MatchParen cterm=none ctermbg=none ctermfg=red

" this is for highligting yanked text
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  this is remove lag and syntax hi for vue files and commenting  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" git fugitive bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" nnoremap <Leader>gD :Gvdiff<CR>
nnoremap <Leader>gg :Merginal<CR>

