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

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')
