local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    json = { "prettier" },
    python = { "black" },
    shell = { "shfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
    --  async = true,
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- 保存当前窗口视图（光标位置、滚动、折叠等）
    local view = vim.fn.winsaveview()

    -- Remove trailing spaces
    vim.cmd [[%s/\s\+$//e]]

    -- Remove empty lines at the top
    vim.cmd [[
      while getline(1) == ''
        execute '1delete'
      endwhile
    ]]

    -- Ensure one and only one empty line at the end of the file
    vim.cmd [[
      let last_line = line('$')
      if getline(last_line) == ''
        while getline(last_line) == ''
          execute last_line . 'delete'
          let last_line = last_line - 1
        endwhile
      endif
      call append('$', '')
    ]]

    -- 恢复视图
    vim.fn.winrestview(view)
  end,
})

return options
