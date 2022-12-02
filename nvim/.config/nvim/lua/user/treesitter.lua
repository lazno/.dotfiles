local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print "could not require treesitter"
  retrurn
end

configs.setup {
  ensure_installed = "maintained", -- only install mainained language parsers
  sync_install = false, -- install languages async
  ignore_install = { "" }, -- do not install these language parsers
  highlight = {
    enable = true, -- enable synthax highlighting
    disable = { "" }, -- disable syntax highlighting for these languages
    additional_vim_regex_highlighting = false, -- some additional highlighting that vim does out of the box
  },
  indent = {
    enable = true, -- enable automatic indentation when you add a new line
    disable = { "" }, -- disable automatic indentation for these languages
  },
}
