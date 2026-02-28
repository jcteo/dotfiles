" PLUG INSTALLATION
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PROFILE
let vimProfile="default"
if !empty($VIMPROFILE)
  let vimProfile=$VIMPROFILE
endif

let profileDir="~/.config/nvim/profiles/".vimProfile."/"

" Change for Shougo/dein.vim???
" TODO: Check mason
call plug#begin('~/.local/share/nvim/plugged')

"=========PLUGINS
"
" TODO: see CocSearch or fzf. or Telescope Replace ctrlpvim?
" TODO: check plugin for compact code compact in JSON file for example
" TODO: review Coc to Classes, variables definitions navigation (like Ctrl+Click de intelliJ)
" TODO: install vim-visual-multi edit in multilines
" TODO: check nvim-treesitter got jsx highlighting
"
" profile/base
" Plug 'codota/tabnine-nvim', {'do': './dl_binaries.sh'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
"lua
Plug 'nvim-lua/plenary.nvim'
"files
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'scrooloose/nerdtree'
"git
Plug 'pwntester/octo.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
"lsp
Plug 'neovim/nvim-lspconfig'
"Plug 'ctrlpvim/ctrlp.vim'
"visual
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'maksimr/vim-jsbeautify'
Plug 'nanotech/jellybeans.vim'
Plug 'nvim-tree/nvim-web-devicons'
"utils
Plug 'scrooloose/nerdcommenter'
" icon colors on nerdtree
" ALE muestra doble los errores de tsx usando tsserver, por eso se deshabilito
" Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'bling/vim-airline'
Plug 'joonty/vdebug'
" Plug 'editorconfig-vim'
Plug 'vim-scripts/vim-auto-save'

" notes
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" profile/html
if !empty(glob(profileDir."plugins.vim"))
  execute "source ".profileDir."plugins.vim"
endif
call plug#end()

":::LUA

lua require('init')


":::CMP
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

EOF

"=========CONF
" profile/base
colorscheme jellybeans
set hlsearch
set ignorecase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber "numeros de linea
set number
set cursorline

"Fixes 7.4
syntax on
set backspace=2

" TODO: move to profile
set wildignore+=*/target/*,**/target/*,*/node_modules/*

":::CTRLP
" Show buffers
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

":::TELESCOPE
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep_args<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Open files in current window
set hidden

":::NERDTREE
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

"::AUTO-SAVE
"let g:auto_save=1

"::ALE
" let g:ale_linters = {'javascript': ['eslint'], 'less': ['lesshint']}


":::VIM-AIRLINE
set laststatus=2
set t_Co=256
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_theme	= 'powerlineish'
let g:airline#extensions#branch#enabled = 1
"let g:airline_powerline_fonts = 1
"function! AirlineInit()
	"let g:airline_section_a = airline#section#create(['mode'])
	"let g:airline_section_b = airline#section#create(['branch'])
"endfunction
"autocmd VimEnter * call AirlineInit()


" Markdown
" disable folding, vim markdown have an error it closes every key stroke
set nofoldenable


" profile/git
":::FUGITIVE
set diffopt+=vertical

"::: VSNIP
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

"=========MAPS
nmap <C-X> :mksession!<CR>:echo "Sesion Guardada!"<CR>

"Map Navigation
"Moving through tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

"Moving through buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>


" Functions
" Config files
" TODO improve this with a single function
function s:Cfnv()
  tabnew ~/.config/nvim/init.vim
endfunction

function s:Cfa()
  tabnew ~/.config/alacritty/alacritty.yml
endfunction

function s:Cft()
  tabnew ~/.tmux.conf
endfunction

command! Cfnv call s:Cfnv()
command! Cfa call s:Cfa()
command! Cft call s:Cft()

" Octo
command! Octorw Octo pr search type:pr repo:perfectsense/tvazteca user-review-requested:@me

" profiles/html
" TODO: move to brightspot profile
au BufReadPost *.hbs set syntax=html

if !empty(glob(profileDir."source.vim"))
  execute "source ".profileDir."source.vim"
endif


echo "Using profile: ".vimProfile
