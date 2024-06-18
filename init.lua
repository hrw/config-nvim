
vim.cmd [[ colorscheme peachpuff ]]

-- From my .vimrc

vim.opt.wrap = false        		-- don't wrap lines

-- vim.opt.autochdir = true
vim.opt.tabstop = 8     		-- a tab is 8 spaces
vim.opt.backspace = indent,eol,start 	-- allow backspacing over everything in insert mode
vim.opt.autoindent = true		-- always set autoindenting on
vim.opt.copyindent = true		-- copy the previous indentation on autoindenting
vim.opt.number = true  			-- always show line numbers
vim.opt.shiftwidth = 8 			-- number of spaces to use for autoindenting
vim.opt.shiftround = true		-- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.showmatch = true    		-- set show matching parenthesis
vim.opt.ignorecase = true   		-- ignore case when searching
vim.opt.smartcase = true   		-- ignore case if search pattern is all lowercase,
					--    case-sensitive otherwise
vim.opt.smarttab = true     		-- insert tabs on the start of a line according to
                  			--    shiftwidth, not tabstop
vim.opt.hlsearch = true     		-- highlight search terms
vim.opt.incsearch = true   		-- show search matches as you type

vim.opt.history = 1000			-- remember more commands and search history
vim.opt.undolevels = 1000		-- use many muchos levels of undo
vim.opt.wildignore = "*.swp,*.bak,*.pyc,*.class"
vim.opt.title = true			-- change the terminal's title
vim.opt.visualbell = true		-- don't beep

vim.opt.listchars = "tab:>·,trail:·,extends:>"

-- syntax on
-- syntax enable
-- 
-- autocmd FileType text setlocal textwidth=78
vim.cmd [[ autocmd FileType python setlocal colorcolumn=80 ]]
vim.cmd [[ autocmd FileType markdown setlocal textwidth=80 spell spelllang=en_gb ]]
vim.cmd [[ autocmd FileType yaml setlocal cursorcolumn ]]
vim.cmd [[ autocmd FileType yaml.ansible setlocal cursorcolumn ]]
vim.cmd [[ au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible ]]
-- 
-- com Wq wq
-- com W w
-- 
-- hi folded guibg=bg
-- hi folded guifg=green
-- 
-- nmap <C-s> :w <Enter>
-- map <C-s> <esc>:w<Enter>

require 'plugins'

local map = require("utils").map

map("n", "<F2>", ":Telescope buffers<CR>")
map("n", "<XF86Favorites>", ":Telescope keymaps<CR>")

-- some UI settings

vim.opt.guifont = "FiraCode Nerd Font:h10"
