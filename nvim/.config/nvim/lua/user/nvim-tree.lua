local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print("could not require nvim-tree")
  return
end

nvim_tree.setup {
  diagnostics = { -- show any error in the file next to the file name in the tree view
    enable = true,
  },
  git = {
    ignore = false,
  },
  update_focused_file = { -- highlight current file in the tree
    enable = true,
  },
  view = {
    width = 30,
    mappings = {
      list = {
        {key = "l", action = "edit"}, -- open file or folder when pressing enter or "l"
        {key = "h", action = "close_node" }, -- close folder when pressing "h"
        {key = "<C-i>", action = "toggle_file_info" }, -- show file info
        {key = "<C-k>", action = "" }, -- unmap since we use this for window navigation 
      }
    }
  },
}

