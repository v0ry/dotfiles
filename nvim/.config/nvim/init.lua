-- Set global leader keys
vim.g.mapleader = "," -- Sets the global leader key to space
vim.g.maplocalleader = " " -- Sets the local leader key to space

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Load the custom configuration modules
require("config.options") -- Loads options configurations from config/options.lua
require("config.keymaps") -- Loads key mappings from config/keymaps.lua
require("config.lazy") -- Loads Lazy.nvim configuration from config/lazy.lua
require("init") -- This is where plugins are defined
