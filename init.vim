"  Plugins --------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " On-demand loading
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'idanarye/vim-merginal'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'Rykka/colorv.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'digitaltoad/vim-pug'
Plug 'schickling/vim-bufonly'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/transpose-words'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Yilin-Yang/vim-markbar'
" Plug 'mattn/calendar-vim'
" Plug 'vim-scripts/utl.vim'
" Plug 'vimwiki/vimwiki'
" Plug 'hsitz/VimOrganizer'
Plug 'pangloss/vim-javascript'
" Plug 'jceb/vim-orgmode'
" Plug 'metakirby5/codi.vim'
" Plug 'chrisbra/NrrwRgn'
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'brooth/far.vim'
" Plug 'janko-m/vim-test'
" Plug 'elmcast/elm-vim'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Initialize plugin system
call plug#end()
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugkns
" PlugClean[!]	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins


"set encoding, leader and edit vimrc ----------------------------
scriptencoding utf-8
set encoding=utf-8 
let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
" nnoremap <leader><leader>ev :e ~/.vimrc<cr>
" nnoremap <leader>ew :e ~/vimwiki/index.wiki<cr>

" for removing delay in insert mode
augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
augroup END

"airline ----------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#keymap#enabled = '0'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:bufferline_echo = 0
let g:airline_theme='dark'

" colors ---------------------------
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
set background=dark
colorscheme gruvbox
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
" hi EndOfBuffer guibg=#1B1C1C
" hi EndOfBuffer guifg=#1B1C1C
" hi Cursor guifg=green guibg=green
" hi Cursor2 guifg=red guibg=red
" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

" russian keyboard  ----------------------------
set keymap=russian-jcukenwin
set iskeyword=@,48-57,_,192-255
set iminsert=0
set imsearch=0

" line numbers and indents and mouse  ----------------------------
set cursorline
set number
set relativenumber
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set list
set listchars=tab:\|\ 
set scrolloff=2
set mouse=a

"keep history in viminfo file and restore cursor postion ----------------------------
" set viminfo+='10,\"100,:20,%,n~/.nviminfo
"jump to last known positions
" function! ResCur()
"   if line("'\"") <= line("$")
"     normal! g`"
"     return 1
"   endif
" endfunction
" augroup resCur
"   autocmd!
"   autocmd BufWinEnter * call ResCur()
" augroup END
" set shada+='10,\"50,:20,%
set shada+='10,\"50,:20,%

" remove start message
set shm=I



"nerdtree  ----------------------------
silent! nmap <F2> ;NERDTreeToggle<CR>
silent! nmap <F3> ;NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1

" misc  ----------------------------
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set shortmess=a						" remove press enter message
set hidden " buffers
" noremap <localleader>g  :wa<Cr>
noremap \g  :wa<Cr>
noremap <leader>w  :wa<Cr>
" set cc=80                   " set an 80 column border for good coding style

"set key bindings for quick window movement----------------------------
nnoremap <A-o> <C-w><C-w>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" 

" Maintain undo history between sessions
set undofile 
set undodir=~/.local/share/nvim/undodir

" hilight search - ----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

"easymotion configuration
" s{char}{char} to move to {char}{char}
nmap <Space>f <Plug>(easymotion-overwin-f)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
" nmap <leader>a <Plug>(easymotion-s2)
" nmap <leader>s <Plug>(easymotion-s)
" nmap <leader>l <Plug>(easymotion-bd-jk)

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
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
" here was problem with inoremap ****************************** 
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

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
" nnoremap <Leader>w :Wg<CR>
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
" command! -bang -nargs=* Wg call fzf#vim#ag(<q-args>, {'dir': '~/vimwiki/'}, <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>,  <bang>0)


"set size of the windows *************************
" set winheight=7
" set winminheight=7
" set winheight=999
"resize windows with ease *********************
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
"remap ; : ***************************
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>o <C-w>o
" set splitbelow
set splitright

"Close a window
nnoremap <silent><leader>q :q<cr>

" Close buffer
noremap <silent><leader>d :bd<cr>
noremap <silent><leader><leader>d :bd!<cr>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

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
"this is easyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" open help in vertical split
" :vert he topic
autocmd FileType help wincmd L
cabbrev h vert bo h

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
\   'vue': ['eslint'],
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
" hi MatchParen guibg=yellow guifg=black

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
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.pug.javascript.scss
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" git fugitive bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" nnoremap <leader>gl :silent! Glog<CR>
" nnoremap <Leader>gD :Gvdiff<CR>
nnoremap <Leader>gg :Merginal<CR>

" deoplete init
" let g:deoplete#enable_at_startup = 1
" " ternjs
" let g:deoplete#sources#ternjs#docs = 1
" let g:deoplete#sources#ternjs#include_keywords = 1
" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue',
"                 \ ]

let g:nrrw_rgn_hl = 'Search'	"narrow region highlight

command! -nargs=* -bang -range -complete=filetype NN
						\ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
						\ | set filetype=<args>


"  clipboard paste in quotes  - stamp class in quotes "
"""""""""""""""""""""""""""""""
nmap <localleader>s <Plug>Csurround'"
nmap <localleader><localleader>s <Plug>Csurround"'
nnoremap S di""0P
" set clipboard=unnamed

" this is neosnippet  -------------------------
let g:neosnippet#snippets_directory='~/.local/share/nvim/neosnippet/'
" let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippets/'
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
set completeopt-=preview
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
nnoremap <leader>ue :NeoSnippetEdit -split -vertical<CR>

" let g:switch_mapping = ""

let g:switch_custom_definitions =
		\ [
		\		['TODO', 'WAIT', 'DONE', 'CANCELLED'],
		\		['bottom', 'top'], ['left', 'right'], ['margin', 'padding'], [ 'this', 'that' ], ['width', 'height'], ['front', 'back'],
		\		{
		\			'#\(.*\)#$': '//\1',
		\			'//\(.*\)$': '/\*\1\*/',
		\			'/\*\(.*\)\*/$': '<!--\1-->',
		\			'<!--\(.*\)-->$': '-\1-',
		\			'-\(.*\)-$': '#\1#'
		\		},
		\ ]

" VimOrganizer setup
" let g:ft_ignore_pat = '\.org'
" filetype plugin indent on
" au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
" au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org/inbox.org'
" command! OrgCapture :call org#CaptureBuffer()
" command! OrgCaptureFile :call org#OpenCaptureFile()
" syntax on
" let g:org_todo_setup='TODO | DONE'


" for Denite
" call denite#custom#var('file/rec', 'command',
" 	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])


" anki script
" function! Anki()
" 	%s/\s|\s/\t/g
" endfunction

" transpose words ( swap two words )
nmap <Leader>t <Plug>Transposewords
imap <Leader>t <Plug>Transposewords
cmap <Leader>t <Plug>Transposewords

" sessions 
" nnoremap <localleader>e :source Session.vim<cr>


" make list-like commands more intuitive

function! CCR()
	let cmdline = getcmdline()
	if cmdline =~ '\v\C^(ls|files|buffers)'
		" like :ls but prompts for a buffer command
		return "\<CR>:bd "
	else
		return "\<CR>"
	endif
endfunction
cnoremap <expr> <CR> CCR()

" map '<CR>' in command-line mode to execute the function above
" cnoremap <expr> <CR> CCR()

" set t_md=
nnoremap <Leader>` :GStashList<cr>

" break lines in normal mode

:nnoremap <leader>j i<cr><esc>

" this is easy-scope******************** 
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#FF00E6' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=100

" clone paragraph *************************************
noremap cp yap<S-}>p
" align paragraph ***************************
noremap <leader>a =ip
" remap macro
nnoremap Q @q

" markbar***************************
nmap <Leader>m <Plug>ToggleMarkbar

let g:LanguageClient_serverCommands = {
			\ 'vue': ['vls']
			\ }

" this is for test.vim
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
" nnoremap <silent> t<C-n> :TestNearest<CR>
" nnoremap <silent> t<C-f> :TestFile<CR>
" nnoremap <silent> t<C-s> :TestSuite<CR>
" nnoremap <silent> t<C-l> :TestLast<CR>
" nnoremap <silent> t<C-g> :TestVisit<CR>
