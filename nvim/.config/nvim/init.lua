
-- Plug plugin manager commands
--   - :PlugStatus to check status of plugins
--   - :PlugInstall to install them all
--   https://github.com/junegunn/vim-plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin');

Plug('neovim/nvim-lspconfig')
Plug('arcticicestudio/nord-vim')
-- We recommend updating the parsers on update
--Plug('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
-- :TSPlaygroundToggle
--"Plug('nvim-treesitter/playground')

Plug('tpope/vim-fugitive')

Plug('itchyny/lightline.vim')

-- Sneak plugin - move round files with sAB where AB is seach term
Plug('justinmk/vim-sneak')

-- Put nice little diff lines on changes
Plug('mhinz/vim-signify')

-- GLSL shader support
Plug('tikhomirov/vim-glsl')

Plug('mcchrish/nnn.vim')

Plug('akinsho/toggleterm.nvim')

Plug('RishabhRD/popfix')
Plug('RishabhRD/nvim-cheat.sh')

-- Xcode support (should this be ifdefed for linux?)
Plug('tami5/xbase')

-- Duck (or cat)
Plug('tamton-aquib/duck.nvim')

-- CSV support: This is awesome:
-- 	https://github.com/mechatroner/rainbow_csv
-- 	- :RbSelecte to do searches 
Plug('mechatroner/rainbow_csv')

-- Marks in the side panel
Plug('chentoast/marks.nvim')

-- Allows regions ot have on syntax (galvinise)
Plug('inkarkat/vim-SyntaxRange')

Plug('nvim-treesitter/nvim-treesitter')
	--, {['do'] = function() vim.fn[':TSUpdate'] end})

Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })

--Plug 'jerrymarion/xcodebuild.vim'
vim.call('plug#end')

-- If lightline is installed; it shows the mode; so we can disable the -- INSERT -- 
-- at the bottom of the screen
--set noshowmode

vim.cmd.colorscheme "catppuccin-mocha"

--set backspace=indent,eol,start  " more powerful backspacing
--set ruler               " show the cursor position all the time

-- * n: normal only
-- * v: visual and select
-- * o: operator-pending
-- * x: visual only
-- * s: select only
-- * i: insert
-- * c: command-line
-- * l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

-- Map Alt-<hjkl> to be movement keys, even in terminal mode.
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("i", "<A-h>", "<C-w>h", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("i", "<A-j>", "<C-w>j", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("i", "<A-k>", "<C-w>k", { noremap = true, desc = "Move Cursor between windows" })
vim.keymap.set("i", "<A-l>", "<C-w>l", { noremap = true, desc = "Move Cursor between windows" })



-- Put things in '*' by default: So p/y copy to/from X selections.
vim.cmd[[set clipboard=unnamedplus]]

-- Ctrl-C/Ctrl-V yank/paste
--:nnoremap <C-v> "+p
--:inoremap <C-v> <C-r>+
--:vnoremap <C-c> "+y


--syn on

-- Turn on spell check for certain filetypes automatically
--autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
--autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
--autocmd FileType gitcommit setlocal spell spelllang=en_us

-- For the signifiy plugin, just show a marker, not a count for deleted lines
--let g:signify_sign_show_count = 0

-- Set some context when scrolling; keep at least N lines
--set scrolloff=2

--
-- Stolen from https://rishabhrd.github.io/jekyll/update/2020/09/19/lspconfig_config.html
--

local lsp_flags = {
}

require'lspconfig'.clangd.setup{}

local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Seems buggy at work.
  client.server_capabilities.semanticTokensProvider = nil

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
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', "<space>t", '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "tsserver", "pyright",
	sourcekit = {
		root_dir = lspconfig.util.root_pattern(".git", "Package.swift", "compile_commands.json")
	}

}
require'lspconfig'.sourcekit.setup{}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach, flags = lsp_flags }
end
lspconfig.lua_ls.setup{
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
--		-> ~/.local/state/nvim/lsp.log
--		-> ~/.cache/nvim/lsp.log

require'lspconfig'.lua_ls.setup{}

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
	open_mapping = [[<c-T>]],
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

-- So a new command to use xcodemake
--vim.api.nvim_create_user_command('CompileCommands', 
--	'!xcodebuild | xcpretty --report json-compilation-database --output compile_commands.json');

-- THis doesn't search the install path for some reason
-- require('treesitter')

require'nvim-treesitter.configs'.setup {
  highlight = {
   enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

