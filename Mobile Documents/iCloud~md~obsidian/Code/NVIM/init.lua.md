TOC

- [Package Manager](#Package%20Manager)
	- [Lazy.nvim](#Lazy.nvim)
- [Plugins](#Plugins)
	- [Which Key](#Which%20Key)
- [Config](#Config)
- [Native Vim](#Native%20Vim)
	- [Netrw](#Netrw)

-------------------------------------------------------------------
├── .DS_Store
├── init.lua
├── lazy-lock.json
└── lua
    ├── .DS_Store
    ├── config
    │   ├── README.md
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── settings.lua
    └── plugins
        ├── colorscheme.lua
        ├── copilot.lua
        ├── init.lua
        ├── latex.lua
        ├── luasnip.lua
        ├── neoformat.lua
        ├── nvim-treesitter.lua
        ├── obsidian.lua
        ├── telescope.lua
        ├── undotree.lua
        ├── vimtex.lua
        └── which-key.lua

-------------------------------------------------------------------
# Package Manager 
## Lazy.nvim [Link](https://lazy.folke.io)

# Plugins 
##  Which Key
Remember you [neovim-keymaps](https://github.com/folke/which-key.nvim?tab=readme-ov-file)
**Directly**
```
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
```
**Different file**
```
keyset("n", "<leader>sr", ":%s/<<C-r><C-w>>//g<Left><Left>", { desc = "search and replace" } ) -- Add desc for which-key
```
#which-key 

# Vim-Matchup 
**Jumping between matches**: Easily jump between matching elements using `%` or other commands.

# Config

# Native Vim  
## Netrw
[Netrw build in file explorer](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)

[[Nvim]] [[Error]] Handling
