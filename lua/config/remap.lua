-- Explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Arrow keys
vim.keymap.set('n', '<S-Up>', "<nop>")
vim.keymap.set('n', '<S-Down>', "<nop>")
vim.keymap.set('n', '<S-Left>', "<nop>")
vim.keymap.set('n', '<S-Right>', "<nop>")
vim.keymap.set('n', '<Up>', "<nop>")
vim.keymap.set('n', '<Down>', "<nop>")
vim.keymap.set('n', '<Left>', "<nop>")
vim.keymap.set('n', '<Right>', "<nop>")
