-- Plugins will be downloaded under the specified directory.
local Plug = vim.fn['plug#']

-- download Plug to have latest one if not present
vim.cmd([[
    if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
    endif
]])

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Declare the list of plugins.

-- common libraries
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons') -- coloured icons (preview with :NvimWebDeviconsHiTest command)
Plug('ryanoasis/vim-devicons')

-- automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug('tpope/vim-sleuth')

Plug('preservim/nerdtree')
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('tiagofumo/vim-nerdtree-syntax-highlight')

Plug('NeogitOrg/neogit')
Plug('sindrets/diffview.nvim')

-- Debian 'bookworm' has Neovim 0.7
if vim.fn.has('nvim-0.8') == 1 then
	Plug('lewis6991/gitsigns.nvim')
	Plug('akinsho/bufferline.nvim')
else
	Plug('lewis6991/gitsigns.nvim', {tag = 'v0.6'})
	Plug('akinsho/bufferline.nvim', {tag = 'v1.*'})
end

Plug('vim-scripts/zoom.vim')

-- Telescope with deps
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')

require('neogit').setup()
require('gitsigns').setup()
require("bufferline").setup()
require("nvim-treesitter").setup()
