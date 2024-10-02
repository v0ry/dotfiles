return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")

      cmp.setup {
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(),
            { "i", "c" }),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
          })
        },
        -- ordered by priority
        sources = {
          { name = "luasnip" }, -- including Latex
          -- { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp",               keyword_length = 1 },
          { name = "path" },
          -- { name = "nvim_lua" },
          { name = "buffer" },
          { name = "cmdline" },
        },
      }
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "buffer" } }
      })

      cmp.setup.cmdline({ ":" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "cmdline" }, { name = "path" } }
      })
    end
  }, 
  -- {
  --   "iurimateus/luasnip-latex-snippets.nvim",
  --   branch = "fix/lazy-loading",
  --   -- vimtex isn't required if using treesitter
  --   dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  --   ft = { "tex", "latex" },
  --   config = function()
  --     require'luasnip-latex-snippets'.setup({
  --       use_treesitter = true
  --     })
  --     require("luasnip").config.setup { 
  --       enable_autosnippets = true 
  --     }
  --   end
  -- },
    {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require'luasnip-latex-snippets'.setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup { enable_autosnippets = true }
    end
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-path" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()      
      require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
        }
    end, 
  },
  { 
    "neovim/nvim-lspconfig", 
    config = function()
      require("lspconfig").texlab.setup({})
    end, 
  }, 
}
