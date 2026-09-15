return {
    {
        "catppuccin/nvim",
        name     = "catppuccin",
        lazy     = false,
        priority = 1000,
        opts     = {
            flavour    = "macchiato",
            lsp_styles = {
                underlines = {
                    errors      = { "undercurl" },
                    hints       = { "undercurl" },
                    warnings    = { "undercurl" },
                    information = { "undercurl" },
                },
            },
            integrations = {
                cmp                = true,
                gitsigns           = true,
                indent_blankline   = { enabled = true },
                lualine            = true,
                mason              = true,
                neo_tree           = true,
                telescope          = true,
                treesitter         = true,
                treesitter_context = true,
                which_key          = true,
            }
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin-macchiato")
        end
    },
    {
        "bjarneo/aether.nvim",
        branch   = "v2",
        name     = "aether",
        lazy     = false,
        priority = 900,
        opts     = {
            transparent = false,
            colors      = {
                bg           = "#0d0d0d",
                bg_dark      = "#0d0d0d",
                bg_highlight = "#fdfdfd",
                fg           = "#ffffff",
                fg_dark      = "#ececec",
                comment      = "#fdfdfd",
                red          = "#a4a4a4",
                orange       = "#a4a4a4",
                yellow       = "#cecece",
                green        = "#b6b6b6",
                cyan         = "#b0b0b0",
                blue         = "#8d8d8d",
                purple       = "#9b9b9b",
                magenta      = "#9b9b9b",
            }
        },
        config = function(_, opts)
            require("aether").setup(opts)
        end
    }
}
