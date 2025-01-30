-- place this in one of your configuration file(s)
local hop_status_ok, hop = pcall(require, "hop")
if not hop_status_ok then
  print "could not require hop"
  return
end
local hop_hint_status_ok, hop_hint = pcall(require, "hop.hint")
if not hop_hint_status_ok then
  print "could not require hop.hint"
  return
end
local directions = hop_hint.HintDirection

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

 vim.keymap.set('', '<leader>f', function()
   hop.hint_char1({ current_line_only = false })
 end, {remap=true})
 vim.keymap.set('', '<leader>t', function()
   hop.hint_char1({  current_line_only = false, hint_offset = -1 })
 end, {remap=true})
