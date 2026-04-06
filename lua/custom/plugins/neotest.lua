vim.keymap.set('n', '<leader>rat', "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>", { desc = '[R]un [A]ll [T]ests' })
vim.keymap.set('n', '<leader>rt', "<cmd>lua require('neotest').run.run()<CR>", { desc = '[R]un [T]est' })
vim.keymap.set('n', '<leader>st', "<cmd>lua require('neotest').run.stop()<CR>", { desc = '[S]op [T]est' })
vim.keymap.set('n', '<leader>dt', "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", { desc = '[D]ebug [T]est' })
vim.keymap.set('n', '<leader>tts', "<cmd>lua require('neotest').summary.toggle({width = 100})<CR>", { desc = '[T]oggle [T]est [S]ummery' })

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup {
      summary = {
        open = 'botright vsplit | vertical resize 100',
      },
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestArguments = function(defaultArguments, context)
            return defaultArguments
          end,
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
          isTestFile = require('neotest-jest.jest-util').defaultIsTestFile,
        },
      },
    }
  end,
}
