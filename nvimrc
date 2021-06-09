
" Plug plugin manager commands
"   - :PlugStatus to check status of plugins
"   - :PlugInstall to install them all
"   https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'arcticicestudio/nord-vim'
" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" :TSPlaygroundToggle
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'

Plug 'itchyny/lightline.vim'

" Sneak plugin - move round files with sAB where AB is seach term
Plug 'justinmk/vim-sneak'

call plug#end()

" If lightline is installed; it shows the mode; so we can disable the -- INSERT -- 
" at the bottom of the screen
set noshowmode

" And set the scheem to be 'nord'.
" Using wombar as nord fails for some reason
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" I usually use a dark terminal
:set background=dark

set backspace=indent,eol,start  " more powerful backspacing
set ruler               " show the cursor position all the time

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

" Highlight 100th coloumn of text
" FIXME: Should only do on code/md files
let &colorcolumn=join(range(101,200),",")
highlight ColorColumn ctermbg=DarkBlue guibg=blue
set textwidth=100

syn on

" Put things in '*' by default: So p/y copy to/from X selections.
set clipboard=unnamed

" Ctrl-C/Ctrl-V yank/paste
:nnoremap <C-v> "+p
:inoremap <C-v> <C-r>+
:vnoremap <C-c> "+y

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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
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
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "c" },
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "node", "rust" },  -- list of language that will be disabled
  },
}

--Set statusbar
vim.g.lightline = { colorscheme = 'wombat';
      active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
      component_function = { gitbranch = 'fugitive#head', };
}

ENDOFLUA
