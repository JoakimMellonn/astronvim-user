vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})

local config = {
  colorscheme = 'dracula',
  options = {
    opt = {
      scrolloff = 8,
    },
    g = {
      python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10'
    }
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
      ["<leader>Fr"] = { "<cmd>FlutterRun<CR>", desc = 'Flutter Run' },
      ["<leader>Fq"] = { "<cmd>FlutterQuit<CR>", desc = 'Flutter Quit' },
      ["<leader>Fe"] = { "<cmd>FlutterEmulators<CR>", desc = 'Flutter Emulators' },
      ["<leader>FR"] = { "<cmd>FlutterReload<CR>", desc = 'Flutter Reload' },
      ["<leader>Fd"] = { "<cmd>FlutterDevices<CR>", desc = 'Flutter Devices' },
      ["<leader>av"] = { "<cmd>ArduinoVerify<CR>" },
      ["<leader>au"] = { "<cmd>ArduinoUpload<CR>" },
      ["<leader>aus"] = { "<cmd>ArduinoUploadAndSerial<CR>" },
      ["<leader>as"] = { "<cmd>ArduinoSerial<CR>" },
      ["<leader>ab"] = { "<cmd>ArduinoChooseBoard<CR>" },
      ["<leader>apr"] = { "<cmd>ArduinoChooseProgrammer<CR>" },
      ["<leader>ap"] = { "<cmd>ArduinoChoosePort<CR>" },
    },
  },
  --Configure LSPs
  lsp = {
    skip_setup = { "dartls" },
    servers = {
      'pyright',
    },
    config = {
      pyright = {
        config = function()
          local root = vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';')
          if root ~= '' then
            return root .. '/pyrightconfig.json'
          end
        end
      },
    },
    formatting = {
      disabled = {
        "pyright",
      },
    },
  },
}

return config
