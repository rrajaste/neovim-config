vim.g.loaded_netrwPlugin = 0

vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', { desc = '[S]earch [N]eovim files' })

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            'node_modules',
          },
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = 'disabled',
      },
    }
  end,
}
