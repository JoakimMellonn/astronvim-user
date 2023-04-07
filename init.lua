local config = {
  options = {
    opt = {
      scrolloff = 8,
    },
  },
  mappings = {
    n = {
      ["<C-d>"] = { "<C-d>zz" },
      ["<C-u>"] = { "<C-u>zz" },
      ["n"] = { "nzzzv" },
      ["N"] = { "Nzzzv" },
      ["L"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
      "Next buffer" },
      ["H"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer" },
    },
  },
  --Configure LSPs
  lsp = {
    skip_setup = { "dartls" }, -- skip lsp setup because flutter-tools will do it itself
    ["config"] = {
      dartls = {
        -- any changes you want to make to the LSP setup, for example
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    },
  },
}

return config
