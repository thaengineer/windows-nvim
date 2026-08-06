return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "macchiato",
        lsp_styles = {
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            indent_blankline = { enabled = true },
            lualine = true,
            mason = true,
            neo_tree = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            which_key = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-macchiato")
    end
}
