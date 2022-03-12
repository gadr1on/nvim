-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Expressive Mapping helper
local expressive_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { silent = true, expr = true })
end

-- Default Mapping helper
local plug_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = ' '
-- mapper('i', 'jk', '<Esc>')

-- Saving files
mapper('n', '<C-s>', ':w<CR>')
mapper('n', '<leader>s', ':w<CR>')

-- Change Windows
mapper('n', '<C-j>', '<C-w>j')
mapper('n', '<C-k>', '<C-w>k')
mapper('n', '<C-h>', '<C-w>h')
mapper('n', '<C-l>', '<C-w>l')

-- Nice
mapper('n', 'ZE', ':qa!<CR>') -- Close all and exit without saving
mapper('n', '<leader>c',':clo<CR>')  -- Close window

-- Duplitcate Line
mapper('n', 'tt', ':t.<CR>')

-- Navigate buffers
mapper('n', '<S-l>', ':bnext<CR>')
mapper('n', '<S-h>', ':bprevious<CR>')

-- Modify buffers
mapper('n', '<leader>bk', ':bp|bd#<CR>')
mapper('n', '<leader>bv', ':vnew<CR>')
mapper('n', '<leader>ba', ':%bd|e#|bd#<CR>')

--  Toggle Numbers
mapper('n', '<leader>n', ':set nu! rnu!<CR>')

-- use ESC to turn off search highlighting
mapper('n', '<Esc>', ':noh<CR>')

-- Terminal
mapper('t', '<Esc>', '<C-\\><C-n>')
mapper('n', '<leader>tt', ':terminal<CR>')
mapper('n', '<leader>tv', ':vnew<CR>:terminal<CR>')
mapper('n', '<leader>th', ':new<CR>:terminal<CR>')

-- Move text up/down
mapper('n', '<A-j>', ':m .+1<CR>==')
mapper('i', '<A-j>', '<Esc>:m .+1<CR>==')
mapper('v', '<A-j>', ":m '>+1<CR>gv=gv")
mapper('n', '<A-k>', ':m .-2<CR>==')
mapper('i', '<A-k>', '<Esc>:m .-2<CR>==')
mapper('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Resize with arrows
mapper('n', '<C-Down>', ':resize -2<CR>')
mapper('n', '<C-Up>', ':resize +2<CR>')
mapper('n', '<C-Right>', ':vertical resize -2<CR>')
mapper('n', '<C-Left>', ':vertical resize +2<CR>')

-- Indent block
mapper('v', '>', '>gv')
mapper('v', '<', '<gv')

-- Copy to OS clipboard.
mapper('v', '<C-c>', '"+y')
mapper('n', '<C-c>', '"+yy')

mapper('n', 'J', 'mzJ`z')

----------------------
-- Plugins Mappings --
----------------------

-- Telescope
mapper('n', '<Leader>ff', ':Telescope find_files<CR>')
mapper('n', '<Leader>fg', ':Telescope live_grep<CR>')
mapper('n', '<Leader>fb', ':Telescope buffers<CR>')
mapper('n', '<Leader>fk', ':Telescope keymaps<CR>')

-- Tree
mapper('n', '<C-b>', ':NvimTreeToggle<CR>')
