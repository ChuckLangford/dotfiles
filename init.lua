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

-- Global variable to store the terminal buffer ID
local term_buf = nil
local term_win = nil

-----------------------
-- Function to toggle the terminal
-----------------------
function ToggleTerminal()
  -- If the terminal window exists and is visible, hide it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_hide(term_win)
    term_win = nil
    return
  end

  -- If the terminal buffer exists but isn’t visible, show it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_command("botright split")
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(term_win, term_buf)
    vim.api.nvim_win_set_height(term_win, 10) -- Optional: Set a fixed height
    vim.api.nvim_command("startinsert") -- Enter terminal mode
    return
  end

  -- If no terminal exists, create a new one
  vim.api.nvim_command("botright split")
  term_buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(term_win, term_buf)
  -- Get the current working directory from :pwd
  local cwd = vim.fn.getcwd()
  -- Open the terminal in the current working directory
  vim.fn.termopen(vim.o.shell, { cwd = cwd })
  vim.api.nvim_win_set_height(term_win, 10) -- Optional: Set a fixed height
  vim.api.nvim_command("startinsert") -- Enter terminal mode
end

-----------------------
-- Function to use Rg to search the current word --
-----------------------
function SearchCurrentWordWithRg()
	local word = vim.fn.expand("<cword>")
	vim.cmd("Rg " .. word)
end

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
vim.keymap.set('i', 'jk', '<ESC>') -- Exit insert mode by typing "jk"
vim.keymap.set('n', '-', ':Ex<CR>') -- Open netrw file explorer
vim.keymap.set('n', '<LEADER>ev', ':e ~/.config/nvim/init.lua<CR>') -- Edit init.lua
vim.keymap.set('n', '<LEADER>ez', ':e ~/.zshrc<CR>') -- Edit .zshrc
vim.keymap.set('n', '<LEADER>bb', ':Telescope buffers<CR>') -- List open buffers
vim.keymap.set('n', '<LEADER>ff', ':Telescope find_files<CR>') -- Find files
vim.keymap.set('n', '<LEADER>scw', ':lua SearchCurrentWordWithRg()<CR>', { noremap = true, silent = true }) -- Use Rg to search the word currently under the cursor
vim.keymap.set('n', '<C-j>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true }) -- Map CTRL j to the ToggleTerminal function
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:lua ToggleTerminal()<CR>', { noremap = true, silent = true }) -- Map CTRL j in terminal mode to toggle it closed
