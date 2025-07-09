return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").tsserver.setup({})
      require("lspconfig").angularls.setup({})
    end,
  },
  -- Optional: Install prettier for formatting
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "typescript", "javascript", "angular" },
          }),
        },
      }
    end,
  },
}
