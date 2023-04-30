--fetch keymap function
local map = vim.api.nvim_set_keymap

--change leader key
vim.g.mapleader = ","

-- map the key n to run the command :NvimTreeToggle
map('n', 'n', [[:NvimTreeToggle<CR>]], {})

--CTRL+s to save the file
map('n', '<C-s>', [[:w<CR>]], {})

-- Nvim-dap keymappings
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- C+d will debugmode and remove NvimTree 
map('n', '<C-d>', [[:NvimTreeToggle<CR> :lua require'dapui'.toggle()<CR>]], {})
-- Ctrl + b sets a breakpoint
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press Ctrl + l to set logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil,nil, vim.fn.input('Log Point Msg: '))<CR> ]], {})

-- Press f10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Press f11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Press f12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press f6 to open a REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- dl reruns the last debug configuration
map('n', '<dl>', [[:lua require'dap'.run_last()<CR>]], {})
