return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' }, -- optional; drop it and set terminal.provider = 'native'
  init = function()
    -- The Claude panel is a terminal in insert (terminal) mode, so the normal-mode
    -- <C-h> window mapping doesn't apply there. Add a buffer-local one.
    vim.api.nvim_create_autocmd('TermOpen', {
      group = vim.api.nvim_create_augroup('claudecode-window-nav', { clear = true }),
      callback = function(args)
        if not vim.api.nvim_buf_get_name(args.buf):lower():find('claude', 1, true) then
          return
        end
        vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { buffer = args.buf, desc = 'Move focus to the left window' })
        vim.keymap.set('n', '<C-h>', '<C-w>h', { buffer = args.buf, desc = 'Move focus to the left window' })
        -- Make <C-w> start a window command (e.g. <C-w>h) instead of deleting a word in Claude
        vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { buffer = args.buf, desc = 'Window command' })
      end,
    })
  end,
  opts = {
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.35,
      -- provider = 'native',   -- if you don't want snacks.nvim
      -- provider = 'external', -- if you prefer running claude in a tmux pane
    },
  },
  keys = {
    { '<leader>a', nil, desc = '[A]I / Claude Code' },
    { '<leader>aw', '<cmd>ClaudeCode<cr>', desc = 'Toggle [A]gent [W]indow' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = '[F]ocus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = '[R]esume session' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = '[C]ontinue last session' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current [B]uffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = '[S]end selection' },
    { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', desc = 'Add file from tree', ft = { 'neo-tree' } },
    { '<leader>ay', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>an', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Reject diff' },
  },
}
