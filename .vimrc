" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'cakebaker/scss-syntax.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --tern-completer
  endif
endfunction
" Disable for pluralsight
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'kchmck/vim-coffee-script'

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'airblade/vim-rooter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-rails'
Plug 'mustache/vim-mustache-handlebars'
" Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'gabrielelana/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
" Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'trotzig/import-js'
Plug 'mlr-msft/vim-loves-dafny'
Plug 'claco/jasmine.vim'
Plug 'elzr/vim-json'
Plug 'wizicer/vim-jison'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
" Plug 'airblade/vim-gitgutter', { 'on': [] }
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-dispatch'
Plug 'craigdallimore/vim-jest-cli'
Plug 'wesQ3/vim-windowswap'
Plug 'jpalardy/vim-slime'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'gcorne/vim-sass-lint'
Plug 'jaxbot/browserlink.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
" Colorscheme plugins
Plug 'altercation/vim-colors-solarized'
Plug 'yosiat/oceanic-next-vim'
Plug 'fabi1cazenave/kalahari.vim'
Plug 'queyenth/oxeded.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'AlessandroYorba/Alduin'
Plug 'trevordmiller/nova-vim'

call plug#end()

" Pathogen
" execute pathogen#infect()

" General Config
syntax on
set t_Co=256
filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8
set tabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set number
set hlsearch
set exrc
set signcolumn=yes
set incsearch
set clipboard=unnamed
set belloff=all

" Omnifunc
" Disable for pluralsight
set omnifunc=syntaxcomplete#Complete

" matchit for vim-textobj-rubyblock
runtime macros/matchit.vim

" Handle CSS with background data pngs
set synmaxcol=200

" terryma/vim-multiple-cursors
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" itchyny/lightline.vim
set laststatus=2
set statusline+=%F

" \ 'colorscheme': 'wombat',
" \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
" \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'relativepath', 'modified' ] ],
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'ale', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component_expand': {
      \   'ale': 'ALEGetStatusLine',
      \ },
      \ 'component_type': {
      \   'ale': 'error',
      \ },
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Recursively look for tags file
set tags=./tags,tags;$HOME

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Mouse scrolling
set mouse=nicr

" Splits (https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally)
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Show dotfiles
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.git$']

let NERDSpaceDelims=1

" LaTeX
let g:livepreview_previewer = 'Preview.app'

" Elm
" ElmCast/elm-vim
let g:elm_format_autosave = 0
let g:elm_detailed_complete = 1

" Dispatch
let g:dispatch_tmux_height = 20

" Show list chars
"set list
"set listchars=tab:>-,trail:~,extends:>,precedes:<

" Ensure start in buffer
" autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h

" Tabbing for specific file types
autocmd FileType java setlocal tabstop=4 shiftwidth=4
autocmd FileType elm setlocal tabstop=4 shiftwidth=4 expandtab

" Filetype syntax associations
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile,*.jbuilder set filetype=ruby
au BufRead,BufNewFile *.jison set filetype=yacc
au BufRead,BufNewFile *.jisonlex set filetype=javascript
au BufRead,BufNewFile .eslintrc,.jshintrc,.babelrc set filetype=json
au BufRead,BufNewFile *.cson set filetype=coffee
au BufRead,BufNewFile *.pml call SetPmlOptions()
au BufRead,BufNewFile *.adoc call SetAdocOptions()
au BufRead,BufNewFile,BufWritePost *Spec.js set filetype=jasmine.javascript.jsx

" remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Helper functions
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

function! SetPmlOptions()
  set filetype=xml
  set spell
  syntax spell toplevel
endfunction

function! SetAdocOptions()
  set spell
  syntax spell toplevel
endfunction

" JavaScript
let g:jsx_ext_required = 0 " Enable jsx for .js files
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
command! Jest Dispatch jest
" autocmd FileType javascript,javascript.jsx set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ all
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js Neoformat
" let g:neoformat_javascript_customprettier = {
"             \ 'exe': 'prettier',
"             \ 'args': ['--stdin', '--parser flow', '--single-quote', '--trailing-comma all'],
"             \ 'stdin': 1,
"             \ }

let g:neoformat_enabled_javascript = ['customprettier']

" Markdown
" Auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 wrap

" Use octodown as default build command for Markdown files
" autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
" let g:vim_markdown_fenced_languages = ['js=javascript']
" let g:markdown_fenced_languages = ['js=javascript']

" Slime
let g:slime_target = 'tmux'

" Close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" matze/vim-move
let g:move_key_modifier = 'C'

" YouCompleteMe and UltiSnips
" (https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:UltiSnipsSnippetsDir             = '~/.vim/UltiSnips'
"let g:UltiSnipsSnippetDirectories      = ['UltiSnips']
"let g:UltiSnipsDontReverseSearchPath   = '1'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:loaded_youcompleteme = 1
" Disable for pluralsight
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

" " Display line at col 80
" if exists('+colorcolumn')
"   let &colorcolumn = "80"
"   hi ColorColumn ctermbg=darkgray guibg=#063541
" endif

" let g:indentLine_color_term='darkgray'
" let g:indentLine_char='·'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*

" Ale
" ===
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_flow_executable = 'node_modules/.bin/flow'

augroup AutoAle
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

" Rooter
" ======
let g:rooter_silent_chdir = 1

" Ack.vim
" =======
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" cnoreabbrev ag Ack
" cnoreabbrev aG Ack
" cnoreabbrev Ag Ack
" cnoreabbrev AG Ack  

" FZF
" ===
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" splitjoin
" =========

let g:splitjoin_trailing_comma = 1

" Mappings
" ========

" Toggle nerdtree
map <C-e> :NERDTreeToggle<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap Q :q!<CR>
inoremap jk <esc>
" Find current file in nerdtree
nmap ,n :NERDTreeFind<CR>

" Find errors with ALE
nmap <leader>e <Plug>(ale_previous_wrap)
nmap <leader>f <Plug>(ale_next_wrap)

" ALE error details
map <leader>k :ALEDetail<CR>

" Ctrl+p fuzzy file search
map <C-p> :FZF<CR>

" Quickfix close and open
nmap <leader>cx :cclose<CR>
nmap <leader>co :copen<CR>

" Loclist
nmap <leader>lc :lclose<CR>
nmap <leader>lo :lopen<CR>

" Redraw garbled buffers
nmap <leader>r :redraw!<CR>

" AG search word under cursor
nmap <silent> <leader>ag :Ag <c-r><c-w><cr>

" Switch buffer
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>

" Maintain undo history between sessions
set undofile

" Colors
" ======

" Dark
set background=dark
" set background=light
"colorscheme solarized
"colorscheme nova
"colorscheme alduin
"colorscheme lucius
"let g:lucius_style = 'dark'
"let g:lucius_contrast = 'high'
"let g:lucius_contrast_bg = 'high'

"colorscheme OceanicNext
colorscheme kalahari
"colorscheme oxeded

"colorscheme Tomorrow-Night-Eighties
"colorscheme hybrid
"colorscheme monokai
"colorscheme wombat256
"colorscheme babymate256
"colorscheme grb256

" Light
" colorscheme beauty256

" Save your backup files to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or .
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swap files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backup files, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
