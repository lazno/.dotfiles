local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system{
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim ..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Could not find packer, exiting.."
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

-- Install plugins here
return packer.startup(function(use)

  use {"wbthomason/packer.nvim", commit = "dcd2f380bb49ec2dfe208f186236dd366434a4d5"} -- Have packer manage itself
  use {"nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7"} -- Useful lua functions used by lots of plugins
  use {"nvim-tree/nvim-tree.lua",  -- A file explorer
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      commit = "829e9f68e10a998198e17bf5b348a6947f9d3c2e"
  }
  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
