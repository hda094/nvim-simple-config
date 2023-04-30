--disable netrw (:Explore normally opens netrw)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--enable gui colors for terminal
vim.opt.termguicolors = true 

--require that we use nvim-tree
require('nvim-tree').setup()

-- function to open nvim-tree
local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file and focus it
  require("nvim-tree.api").tree.toggle({ focus = true, find_file = true, })
end

-- call the function on VimEnter
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

