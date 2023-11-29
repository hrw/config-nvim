-- Plugins will be downloaded under the specified directory.
vim.call('plug#begin', '~/.config/nvim/plugged')
local Plug = vim.fn['plug#']

-- Declare the list of plugins.
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug('nvim-tree/nvim-web-devicons')

Plug('folke/which-key.nvim')
Plug('Valloric/MatchTagAlways', {ft = 'html'})
Plug('tpope/vim-fugitive')

Plug('lewis6991/gitsigns.nvim')

-- LSP
Plug('neovim/nvim-lspconfig')
Plug('VonHeikemen/lsp-zero.nvim')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')

-- buffer bar
Plug('nvim-tree/nvim-web-devicons') --" Recommended (for coloured icons)
Plug('akinsho/bufferline.nvim')

-- Snippets
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

Plug('powerman/vim-plugin-AnsiEsc')

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}

require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  configure_diagnostics = false,
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
end)
vim.diagnostic.config({ virtual_text = false })
lsp.setup()

-- vim.lsp.start({
--   name = 'my-server-name',
--   cmd = {'jedi-language-server'},
--   filetypes = {'python'},
--   root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
--   single_file_support = true,
-- })
-- require'lspconfig'.jedi_language_server.setup{}

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

require('gitsigns').setup()
