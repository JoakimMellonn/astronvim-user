return {
  'HallerPatrick/py_lsp.nvim',
  event = "VeryLazy",
  config = function()
    require("py_lsp").setup {
      host_python = "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10",
      default_venv_name = ".venv"
    }
  end
}
