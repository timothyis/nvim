require('core.options')

require('core.plugins')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Define augroup and autocmds
    require('core.autocmd')
    -- Define key mappings for Neovim built-in functionality
    require('core.mappings')
  end,
})
