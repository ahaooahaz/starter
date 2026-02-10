return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "hrsh7th/cmp-cmdline",
        event = {"CmdlineEnter", "InsertEnter"},
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                preselect = cmp.PreselectMode.None,
                completion = {
                    completeopt = 'menu,menuone,noselect',
                },
                mapping = {
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() and cmp.get_selected_entry() then
                            cmp.confirm({ select = false })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                },
            })
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end
    },
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },
    {
        "Mofiqul/dracula.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                char = "┋",
            },
        }
    },
}
