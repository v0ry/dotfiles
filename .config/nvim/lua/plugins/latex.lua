return {
{
  "iurimateus/luasnip-latex-snippets.nvim",
  branch = "fix/lazy-loading",
  -- vimtex isn't required if using treesitter
  dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  config = function()
    require'luasnip-latex-snippets'.setup()
    -- or setup({ use_treesitter = true })
    require("luasnip").config.setup { enable_autosnippets = true }
      end
    }
}
