local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  print "could not require cmp"
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  print "could not require luasnip"
  return
end

-- part of supertab setup
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- https://github.com/L3MON4D3/LuaSnip#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- added from nvim-cmp setup guid
    end
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- cyclye through the results one by one
    ["<C-j>"] = cmp.mapping.select_next_item(),  -- cyclye through the results one by one
    ["<C-Space>"] = cmp.mapping.complete(), -- trigger completion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll through the docs popup
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll through the docs popup
    ["<C-e>"] = cmp.mapping.abort(), -- abort completion
    ["<CR>"] = cmp.mapping.confirm({select = true}), -- confirm a completion suggestions

    -- setup supertab
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources {
    { name = "nvim_lua" }, -- completion for the neovim lua api
    { name = "luasnip" }, -- completion by luasnip
  }
}
