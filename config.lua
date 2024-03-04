-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "NLKNguyen/papercolor-theme" },
  {
    "sainnhe/gruvbox-material",
    config = function()
      require('onedark').setup({
        theme = 'gruvbox-material',
        background = 'hard',
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup({
        style = 'darker'
      })
    end,
  },
  { "marko-cerovac/material.nvim" },
  { "lunarvim/colorschemes" },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add Neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_indent_guides = false,
        inverse = true,         -- invert background for search, diffs, statuslines, and errors
        contrast = "",          -- can be "hard", "soft", or an empty string
        palette_overrides = {}, -- specify your own palette colors
        overrides = {},         -- override specific highlight groups
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
    opts = ...
  }
}

lvim.colorscheme = "gruvbox-material"
vim.g.material_style = "dark"

vim.opt.termbidi = true

-- setup formater
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  }
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

lvim.format_on_save.enabled = true
