vim.keymap.set('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = '[R]ename [F]ile' })

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      expose_as_code_action = 'all',
    },
  },
}
