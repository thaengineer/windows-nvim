return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "json",
            "kusto",
            "markdown",
            "powershell",
            "regex",
            "sql",
            "xml",
            "yaml"
        },
        highlight = {
            enable = true,
            disable = { "powershell" },
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true }
    }
}
