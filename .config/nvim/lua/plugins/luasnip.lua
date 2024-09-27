return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
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
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Left>"] = cmp.mapping.select_prev_item(),
          ["<Right>"] = cmp.mapping.select_next_item(),
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
        sources = cmp.config.sources({
          { name = "luasnip" }, -- including Latex
          { name = "nvim_lsp",               keyword_length = 1 },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
          { name = "nvim_lua" },
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "buffer" } }
      })

      cmp.setup.cmdline({ ":" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "cmdline" }, { name = "path" } }
      })
    end,
  }, 
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    branch = "fix/lazy-loading",
    -- vimtex isn't required if using treesitter
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require'luasnip-latex-snippets'.setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup { enable_autosnippets = true }
        end,
      },
  {
    "hrsh7th/cmp-buffer", 
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp", 
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
  },
  {
  "L3MON4D3/LuaSnip",
  lazy = false,
  dependencies = { 
      { "saadparwaiz1/cmp_luasnip" },
      { "iurimateus/luasnip-latex-snippets.nvim" },
  },
  keys = {
    {
      "<C-l>", -- ctrl + l
      function() require("luasnip").jump(1) end,
      desc = "Jump forward a snippet placement",
      mode = "i",
      noremap = true,
      silent = true,
    },
    {
      "<C-h>",
      function() require("luasnip").jump(-1) end,
      desc = "Jump backward a snippet placement",
      mode = "i",
      noremap = true,
      silent = true,
    }
    },
    config = function()
      -- require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
      require("luasnip.loaders.from_vscode").lazy_load({
          path = "/Users/koka/.local/share/nvim/lazy/luasnip-latex-snippets.nvim/lua/luasnip-latex-snippets/"  
        })
    end
  }
  }
