" Plug plugin manager commands
"   - :PlugStatus to check status of plugins
"   - :PlugInstall to install them all
"   https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'arcticicestudio/nord-vim'
" We recommend updating the parsers on update
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" :TSPlaygroundToggle
""Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'

Plug 'itchyny/lightline.vim'

" Sneak plugin - move round files with sAB where AB is seach term
Plug 'justinmk/vim-sneak'

" Put nice little diff lines on changes
Plug 'mhinz/vim-signify'

" GLSL shader support
Plug 'tikhomirov/vim-glsl'

Plug 'mcchrish/nnn.vim'

Plug 'akinsho/toggleterm.nvim'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Xcode support (should this be ifdefed for linux?)
Plug 'tami5/xbase'

" Duck (or cat)
Plug 'tamton-aquib/duck.nvim'

" CSV support: This is awesome:
" 	https://github.com/mechatroner/rainbow_csv
" 	- :RbSelecte to do searches 
Plug 'mechatroner/rainbow_csv'

" Marks in the side panel
Plug 'chentoast/marks.nvim'

call plug#end()

" If lightline is installed; it shows the mode; so we can disable the -- INSERT -- 
" at the bottom of the screen
set noshowmode

" And set the scheem to be 'nord'.
" Using wombar as nord fails for some reason
" inactive doesn't seem to work :-(
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'inactive': { 'left': [['filename', 'modified']] },
      \ }

" I usually use a dark terminal
:set background=dark

set backspace=indent,eol,start  " more powerful backspacing
set ruler               " show the cursor position all the time

" * n: normal only
" * v: visual and select
" * o: operator-pending
" * x: visual only
" * s: select only
" * i: insert
" * c: command-line
" * l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

" Map Alt-<hjkl> to be movement keys, even in terminal mode.
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
:inoremap <A-h> <C-w>h
:inoremap <A-j> <C-w>j
:inoremap <A-k> <C-w>k
:inoremap <A-l> <C-w>l

" Put things in '*' by default: So p/y copy to/from X selections.
set clipboard=unnamed

" Ctrl-C/Ctrl-V yank/paste
:nnoremap <C-v> "+p
:inoremap <C-v> <C-r>+
:vnoremap <C-c> "+y

" Highlight 100th coloumn of text
" FIXME: Should only do on code/md files
let &colorcolumn=join(range(101,200),",")
highlight ColorColumn ctermbg=8 guibg=blue
set textwidth=100

syn on

" Turn on spell check for certain filetypes automatically
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

" For the signifiy plugin, just show a marker, not a count for deleted lines
let g:signify_sign_show_count = 0

" Set some context when scrolling; keep at least N lines
set scrolloff=2

lua << ENDOFLUA
--
-- Stolen from https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
--


require'lspconfig'.clangd.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  -- Turn on the two columns for the signs when we have a language server.
  -- Otherwise it appears when you do an don't want to paste
  vim.wo.signcolumn = 'yes'

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "tsserver", "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, flags = lsp_flags }
end
nvim_lsp.sumneko_lua.setup{
	on_attach=on_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
			completion = { keywordSnippet = "Disable", },
			diagnostics = { enable = true, globals = {
				"vim", "describe", "it", "before_each", "after_each" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				}
			}
		}
	}
}
-- To see logs try:
--      :lua print(vim.inspect(vim.lsp.get_log_path()))
--		-> ~/.cache/nvim/lsp.log


-- Tree-sitter setup
--[[
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "c" },
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "node", "rust" },  -- list of language that will be disabled
  },
}
--]]

--Set statusbar
vim.g.lightline = { colorscheme = 'wombat';
      active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
      inactive = { left = { {  }, { 'readonly', 'filename', 'modified' } } };
      component_function = { gitbranch = 'fugitive#head', };
}

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 80,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved", --{relative='win', border='single', width=80, height=100, bufpos={100,10}},
		winblend = 0,
		width = 100,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})


local Terminal = require("toggleterm.terminal").Terminal
--local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

--	'tamton=aquip/duck.nvim',
vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈") end, {})

--vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
}

--function _LAZYGIT_TOGGLE()
--	lazygit:toggle()
--end

ENDOFLUA
