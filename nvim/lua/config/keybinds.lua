vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

vim.keymap.set("n", "<C-n>", function()
    vim.ui.input({ prompt = "File Address: ", completion = "file" }, function(input)
        if not input or input == "" then return end
        vim.cmd("edit " .. input)
    end)
end)
