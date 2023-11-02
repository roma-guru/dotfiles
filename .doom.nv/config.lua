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

doom.use_package("is0n/jaq-nvim")
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

-- Quickrun config
require('jaq-nvim').setup{
  cmds = {
    -- Uses vim commands
    internal = {
      lua = "luafile %",
      vim = "source %"
    },

    -- Uses shell commands
    external = {
      python   = "python3 %",
      go       = "go run %",
      sh       = "bash %"
    }
  },

  behavior = {
    -- Default type
    default     = "float",

    -- Start in insert mode
    startinsert = false,

    -- Use `wincmd p` on startup
    wincmd      = false,

    -- Auto-save files
    autosave    = true
  },

  ui = {
    float = {
      -- See ':h nvim_open_win'
      border    = "rounded",

      -- See ':h winhl'
      winhl     = "Normal",
      borderhl  = "FloatBorder",

      -- See ':h winblend'
      winblend  = 10,

      -- Num from `0-1` for measurements
      height    = 0.8,
      width     = 0.8,
      x         = 0.5,
      y         = 0.5
    },

    terminal = {
      -- Window position
      position = "bot",

      -- Window size
      size     = 10,

      -- Disable line numbers
      line_no  = false
    },

    quickfix = {
      -- Window position
      position = "bot",

      -- Window size
      size     = 10
    }
  }
}

-- vim: sw=2 sts=2 ts=2 expandtab
