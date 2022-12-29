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

  use { 'nvim-tree/nvim-web-devicons', commit = "189ad3790d57c548896a78522fd8b0d0fc11be31" } -- an icon set used by various plugins
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7"} -- Useful lua functions used by lots of plugins
  use { "folke/tokyonight.nvim", commit = "50594ee3032d867013fa9c9dc4676a2a96c9b660"} -- a colorscheme

  use { "wbthomason/packer.nvim", commit = "dcd2f380bb49ec2dfe208f186236dd366434a4d5"} -- Have packer manage itself
  use { "windwp/nvim-autopairs", commit = "5d75276fce887c0cf433bb1b9867717907211063"} -- autopairs
  use { "nvim-tree/nvim-tree.lua",  commit = "829e9f68e10a998198e17bf5b348a6947f9d3c2e" }-- A file explorer
  
  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      commit = "4953fdf73ef5ada18e1e969019803605f4f4a4ac",
  }
  
  -- use { "scalameta/nvim-metals", commit = "92f7451aa0dd0267027ab9a5850a4b7c1af33341"} -- neovim metals for scala
  use { "scalameta/nvim-metals", commit = "613556dfa4cbdfcba4d515ce781e1b5f284f373c"} -- neovim metals for scala

  -- auto completion with cmp
  use { "hrsh7th/nvim-cmp", commit = "93f385c17611039f3cc35e1399f1c0a8cf82f1fb" } -- auto completion engine 
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completion (just autocomplete with words from current buffer)
  use { "L3MON4D3/LuaSnip", commit = "2172a95476715e86de2fc01972813ee2d018d72d" } -- luasnip engine
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- cmp luasnip integration
  use { "rafamadriz/friendly-snippets", commit = "9b3e497cf0c3abcf73d791968a9768a22405fa13"} -- snippets for luasnip
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" } -- neovim api autocompletion
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" } -- lsp autocompletion

  use { "nvim-lualine/lualine.nvim", commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" }  -- a statusline


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
