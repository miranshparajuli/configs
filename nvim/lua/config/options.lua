vim.opt.number = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.cursorline = true
vim.opt.autochdir = true

vim.wrap = true     

vim.notify = function(msg, log_level, _opts)
  if string.find(msg, "ft_to_lang") then
    return
  end
  return vim.api.nvim_echo({{msg, nil}}, true, {})
end

vim.opt.clipboard = "unnamedplus"

vim.cmd('syntax enable')
local green      = "#a6e22e"
local purple     = "#ae81ff"
local light_red  = "#ff657a"
local light_blue = "#66d9ef"
local yellow     = "#e6db74"
local gray       = "#5c6370"

local syntax_groups = {
    String         = { fg = green },
    Comment        = { fg = gray, italic = true },
    Function       = { fg = light_blue },
    Statement      = { fg = purple, bold = true },
    Keyword        = { fg = purple, bold = true },
    Conditional    = { fg = purple },
    Repeat         = { fg = purple },
    Identifier     = { fg = light_red },
    Type           = { fg = light_blue },
    Constant       = { fg = yellow },
    Number         = { fg = yellow },
    Boolean        = { fg = yellow },
    Operator       = { fg = "#ffffff" },
    PreProc        = { fg = purple },
    Question       = { fg = light_blue, bold = true },
    -- Style the completion popup menu to be sleek/dark
    Pmenu          = { bg = "#111111", fg = "#ffffff" },
    PmenuSel       = { bg = light_blue, fg = "#000000", bold = true },
}

for group, settings in pairs(syntax_groups) do
    vim.api.nvim_set_hl(0, group, settings)
end

