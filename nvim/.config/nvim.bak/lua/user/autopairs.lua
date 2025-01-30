local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
  print "could not require autopairs"
  return
end


autopairs.setup {}
