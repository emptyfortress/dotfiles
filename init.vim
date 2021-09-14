"  Plugins --------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'KabbAmine/yowish.vim'
Plug 'dikiaap/minimalist'
Plug 'tomtom/tcomment_vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'posva/vim-vue'
" Plug 'digitaltoad/vim-pug'
" Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'idanarye/vim-merginal'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/transpose-words'
Plug 'AndrewRadev/switch.vim'
Plug 'gu-fan/colorv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'schickling/vim-bufonly'
Plug 'SirVer/ultisnips'
Plug 'wellle/targets.vim'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugkns
" PlugClean[!]	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins

" filetype plugin indent on    " required

" "Fix for escape delay in terminal ***************************
" set timeoutlen=500 ttimeoutlen=50

" set encoding, leader and edit vimrc ----------------------------
scriptencoding utf-8
set encoding=utf-8 
let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>

" colors -------------------------------------
" set termguicolors " this settings broke colorV
set background=dark
colorscheme gruvbox
" hi Cursor ctermfg=white ctermbg=black
" hi iCursor guifg=white guibg=black
hi EndOfBuffer guibg=#1B1C1C

" quick jump in insert mode
inoremap II <esc>I
inoremap AA <esc>A
inoremap OO <esc>O

" russian keyboard  ----------------------------
set keymap=russian-jcukenwin
set iskeyword=@,48-57,_,192-255
set iminsert=0
set imsearch=0

" line numbers and indents and mouse  ----------------------------
" set cursorline
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

" misc  ----------------------------
set nobackup
set nowritebackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set shortmess=a          " remove press enter message
" open help in vertical split
" :vert he topic
autocmd FileType help wincmd L
cabbrev h vert bo h

" save all buffers
noremap \g  :wa<Cr>      
noremap <leader>w  :w<Cr>
" set cc=80                   " set an 80 column border for good coding style

"set key bindings for quick window movement----------------------------
" nnoremap <A-o> <C-w><C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 
"Close a window
nnoremap <silent><leader>q :q<cr>

" Maintain undo history between sessions
set undofile 
set undodir=~/.local/share/nvim/undodir

" hilight search - ----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>


"keep history in viminfo file and restore cursor postion ----------------------------
set shada+='20,\"50,:100,%
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
" remove start message
set shm=I

"remap ; : ***************************
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>o <C-w>o
set splitbelow
set splitright

" Close buffer
noremap <silent><leader>d :bd<cr>
noremap <silent><leader><leader>d :bd!<cr>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"center cursor while searching and next jumping
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"set global options for substitute
set gdefault
set nowrap

" this is for highligting yanked text
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 300

" COC configuration -------------------------------------------------- 
" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
" set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" begin coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResumeCR>

" Coc-prettier --------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" coc end

"FZF fuzzy finder mapping ********************
" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }
" " Default fzf layout
let g:fzf_layout = { 'down': '~40%' }
" hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Insert mode completion with fzf ************************
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

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

" vue setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  this is remove lag and syntax hi for vue files and commenting  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType vue syntax sync fromstart
" let g:vue_disable_pre_processors=1
" let g:vue_pre_processors = ['pug']
" let g:vue_pre_processors = 'detect_on_enter'
" filetype plugin on
" syntax on
" autocmd FileType vue syntax sync fromstart
" ничего не работает как надо. забил пока. Комменты в pug кастомные
nnoremap gch :TCommentAs pug<cr>

"airline ----------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#keymap#enabled = '0'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:bufferline_echo = 0
let g:airline_theme='dark'

" autopair gentle
let g:AutoPairsUseInsertedCount = 1

"  clipboard paste in quotes  - stamp class in quotes "
"""""""""""""""""""""""""""""""
nmap <localleader><localleader>s <Plug>Csurround'"
nmap <localleader>s <Plug>Csurround"'
" nnoremap <localleader>S di""0P
" nnoremap <localleader>s di'"0P
set clipboard=unnamed

" transpose words ( swap two words )
nmap <Leader>t <Plug>Transposewords
" imap <Leader>t <Plug>Transposewords
cmap <Leader>t <Plug>Transposewords
" clone paragraph *************************************
noremap cp yap<S-}>p
" align paragraph ***************************
" noremap <leader>a =ip
" remap macro
" nnoremap Q @q
" vim-repeat
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" git fugitive bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <Leader>gD :Gvdiff<CR>
nnoremap <Leader>gg :Merginal<CR>
" diff maps
nnoremap <Leader>gj :diffget //3<CR>
nnoremap <Leader>gf :diffget //2<CR>


" supress spam message
function! s:ftplugin_fugitive() abort
  nnoremap <buffer> <silent> cc :Git commit --quiet<CR>
  nnoremap <buffer> <silent> ca :Git commit --quiet --amend<CR>
  nnoremap <buffer> <silent> ce :Git commit --quiet --amend --no-edit<CR>
endfunction
augroup nhooyr_fugitive
  autocmd!
  autocmd FileType fugitive call s:ftplugin_fugitive()
augroup END

"easymotion configuration
nmap <leader>s <Plug>(easymotion-s)
nmap <leader><leader>s <Plug>(easymotion-s2)
" nmap <leader>l <Plug>(easymotion-overwin-line)
" s{char}{char} to move to {char}{char}
" nmap <Space>f <Plug>(easymotion-overwin-f)
" nmap <leader>l <Plug>(easymotion-bd-jk)

" switch values --------------
let g:switch_custom_definitions =
		\ [
		\		['bottom', 'top', 'left', 'right'], 
    \   ['margin', 'padding'], [ 'this', 'that' ], 
    \   ['width', 'height'], ['front', 'back'],
    \   ['space-between', 'center', 'space-around',],
		\		{
		\			'#\(.*\)#$': '//\1',
		\			'//\(.*\)$': '/\*\1\*/',
		\			'/\*\(.*\)\*/$': '<!--\1-->',
		\			'<!--\(.*\)-->$': '-\1-',
		\			'-\(.*\)-$': '#\1#'
		\		},
		\ ]

" move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

"
"another fasd ==============================================
function! s:fasd_update() abort
  if empty(&buftype) || &filetype ==# 'dirvish'
    call jobstart(['fasd', '-A', expand('%:p')])
  endif
endfunction
augroup fasd
  autocmd!
  autocmd BufWinEnter,BufFilePost * call s:fasd_update()
augroup END
command! FASD call fzf#run(fzf#wrap({'source': 'fasd -al', 'options': '--no-sort --tac --tiebreak=index'}))
nnoremap <silent> <leader>ef :FASD<CR>

" set working directory
nnoremap <leader>. :lcd %:p:h<cr>

" increment numbers
source ~/.local/share/nvim/code/increment.vim

" Ultisnips -----------------------------------------------

let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips/"
