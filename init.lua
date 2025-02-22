--------------------------------------------------------------------------------
-- Neovim init.lua configuration file
--
-- This file bootstraps the lazy.nvim plugin manager, configures plugins,
-- sets various Vim options, defines autocmds for filetypes and whitespace,
-- and maps custom keybindings.
--------------------------------------------------------------------------------

---------------------------
-- Bootstrap lazy.nvim --
---------------------------
-- Determine the installation path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If lazy.nvim is not installed, clone it from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  -- Check for errors during cloning
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Prepend lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------
-- Global settings: Leader keys and basic configurations --
--------------------------------------------------------
-- Set the global and local leader keys BEFORE loading plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

----------------------------------
-- Setup Plugins using lazy.nvim --
----------------------------------
require("lazy").setup({
  spec = {
    -- Color scheme and UI plugins
    'ellisonleao/gruvbox.nvim',

    -- Vim utility plugins
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',

    -- Lua helper library
    'nvim-lua/plenary.nvim',

    -- Go development plugin
    'fatih/vim-go',

    -- Git integration
    'lewis6991/gitsigns.nvim',

    -- Movement plugin
    'ggandor/leap.nvim',

    -- FZF plugins for fuzzy finding
    'junegunn/fzf.vim',
    {
      'junegunn/fzf',
      run = function() vim.fn['fzf#install']() end
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    },

    -- LSP and Mason for language server management
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  -- Set the default colorscheme during installation
  install = { colorscheme = { "habamax" } },
  -- Automatically check for plugin updates
  checker = { enabled = true },
})

-- Plugin-specific setups
require('gitsigns').setup()
require('leap').add_default_mappings()
require('mason').setup()
require('mason-lspconfig').setup()

-----------------
-- Vim Options --
-----------------
-- Set basic options for editing
vim.opt.number = true                   -- Show line numbers
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.colorcolumn = "80"              -- Highlight column 80 for line length
vim.opt.termguicolors = true            -- Enable true colors
vim.o.background = "dark"               -- Dark background theme
vim.opt.completeopt = {"menu", "menuone", "noselect"} -- Better completion options
vim.opt.clipboard = "unnamedplus"       -- Use system clipboard

-- Set colorscheme (override default if needed)
vim.cmd([[colorscheme gruvbox]])

-- Change the working directory to your source folder
vim.cmd([[cd ~/Documents/src]])

-- Enable filetype detection, plugins, and indentation rules
vim.cmd([[filetype plugin indent on]])

-----------------------
-- Auto Commands --
-----------------------
-- Define filetype-specific indentation and tab settings using autocmds
vim.api.nvim_exec([[
  autocmd FileType javascript  setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType go          setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType html        setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType css         setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType scss        setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
]], false)

-- Highlight bad whitespace: trailing spaces and leading tabs
vim.api.nvim_exec([[
  highlight BadWhitespace ctermbg=Red guibg=Red
  autocmd BufRead,BufNewFile *.js,*.py,*.pyw match BadWhitespace /^\t\+/
  autocmd BufRead,BufNewFile *.* match BadWhitespace /\s\+$/
]], false)

---------------------
-- Key Mappings  --
---------------------
-- Map keys for quick escape from insert mode and file explorer
vim.keymap.set('i', 'jk', '<ESC>')                    -- Exit insert mode by typing "jk"
vim.keymap.set('n', '-', ':Ex<CR>')                    -- Open netrw file explorer

-- Map leader shortcuts for quick configuration and file access
vim.keymap.set('n', '<LEADER>ev', ':e ~/.config/nvim/init.lua<CR>') -- Edit init.lua
vim.keymap.set('n', '<LEADER>ez', ':e ~/.zshrc<CR>')                -- Edit .zshrc

-- Map leader shortcuts for Telescope (fuzzy finding)
vim.keymap.set('n', '<LEADER>bb', ':Telescope buffers<CR>')         -- List open buffers
vim.keymap.set('n', '<LEADER>ff', ':Telescope find_files<CR>')        -- Find files
