require "nvchad.autocmds"
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
    callback = function()
        local ft = vim.bo.filetype
        if vim.bo.buftype == "" and ft ~= "help" and ft ~= "nvdash" and ft ~= "dashboard" then
            vim.wo.cursorline = true
            vim.wo.cursorcolumn = true
            vim.wo.cursorlineopt = "both"
        else
            vim.wo.cursorline = false
            vim.wo.cursorcolumn = false
        end
    end
})
