return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = { enabled = true },
    picker = { enabled = true },
    terminal = { 
      enabled = true,
      win = {
        style = "terminal",
      },
    },
    quickfile = { enabled = true },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    vim.o.shell = "fish"
  end,
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader> ", function() Snacks.picker.smart() end, desc = "Smart Picker" },
  },
}
