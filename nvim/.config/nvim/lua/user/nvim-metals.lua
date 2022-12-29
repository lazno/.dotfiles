local metals_status_ok, metals = pcall(require, "metals")
if not metals_status_ok then
  print "could not require metals"
  return
end

-- will have to try this out. basically it should provide messages for autocomands for filetypes.
-- https://www.youtube.com/watch?v=ihKdrhPaZjg&t=5447s
-- vim.o.shortmess = string.gsub(vim.o.shortmess, 'F', '') .. 'c'

local metals_config = metals.bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- enable snippet support
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
metals_config.init_options.statusBarProvider = "on"
-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
