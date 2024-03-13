-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

doom.use_package("github/copilot.vim", "is0n/jaq-nvim")
doom.use_keybind({
  {"<f5>", ":Jaq<cr>"},
  {"-", ":e .<cr>"},
  {"<c-s>", ":w<cr>"},
  {"<c-right>", "<c-w>l"},
  {"<c-left>", "<c-w>h"},
  {"<c-up>", "<c-w>k"},
  {"<c-down>", "<c-w>j"}
})


doom.indent = 2
doom.relative_num = false
doom.core.treesitter.settings.show_compiler_warning_message = false
vim.opt.shell = 'xonsh'

-- vim: sw=2 sts=2 ts=2 expandtab
