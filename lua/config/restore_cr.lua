vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_keymap("i", "<CR>", "<CR>", { noremap = true, silent = true })
    end)
  end,
})
