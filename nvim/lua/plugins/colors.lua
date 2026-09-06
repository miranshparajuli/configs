local function enable_transparency ()
    vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
end
return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme moonfly]])
      enable_transparency()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        theme = "moonfly",
    }
  },
}
