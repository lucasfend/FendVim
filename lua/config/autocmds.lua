-- Setup our JDTLS server any time we open up a java file
vim.cmd([[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]])

-- Setup our Ts/Angular/Html server any time we open up a Ts/Angular/Html file
vim.cmd([[
  augroup ts_lsp
    autocmd!
    autocmd FileType typescript,javascript,angular lua require('config.tsls').setup()
  augroup end
]])
