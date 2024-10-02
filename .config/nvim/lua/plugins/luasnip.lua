return {
  { "L3MON4D3/LuaSnip",
    lazy = true, -- Only load when a LuaSnip function is called
    dependencies = { 
      { "saadparwaiz1/cmp_luasnip" },
      { "iurimateus/luasnip-latex-snippets.nvim" },
  },
  keys = {
    {
      "<Tab>", -- ctrl + l
      function() require("luasnip").jump(1) end,
      desc = "Jump forward a snippet placement",
      mode = "i",
      noremap = true,
      silent = true,
    },
    {
      "<S-Tab>",
      function() require("luasnip").jump(-1) end,
      desc = "Jump backward a snippet placement",
      mode = "i",
      noremap = true,
      silent = true,
    }
    },
    config = function()
    require("luasnip.loaders.from_lua").load({ paths = "~/.snippets/" })
       require("luasnip.loaders.from_vscode").lazy_load({
          path = "~/.local/share/nvim/lazy/luasnip-latex-snippets.nvim/lua/luasnip-latex-snippets/"  
        })
    end
  }
}
