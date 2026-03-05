if vim.g.vscode then
else
require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt = "both" -- to enable cursorline!
end
if vim.env.SSH_CONNECTION then
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
