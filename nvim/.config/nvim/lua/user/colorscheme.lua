local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status_ok then
  print "could not require tokyonight"
  return
end

tokyonight.setup( {
  style = "dark",
  terminal_colors = true,
  styles = {
    comments = {italic = true},
    sidebars = "dark",
  },
  sidebars = {"NvimTree"}
})


vim.cmd[[colorscheme tokyonight]]
