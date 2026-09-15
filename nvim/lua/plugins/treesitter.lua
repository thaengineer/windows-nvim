return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "json",
            "kusto",
            "markdown",
            "python",
            "regex",
            "sql",
            "xml",
            "yaml"
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true }
    }
}
