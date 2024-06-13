vim.keymap.set('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = '[R]ename [F]ile' })
vim.keymap.set('n', '<leader>ami', '<cmd>TSToolsAddMissingImports<CR><leader>fm', { desc = '[A]dd [M]issing [I]mports' })
vim.keymap.set('n', '<leader>rui', '<cmd>TSToolsRemoveUnusedImports<CR><leader>fm', { desc = '[R]emove [U]nused [I]mports' })

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      expose_as_code_action = 'all',
    },
  },
}
