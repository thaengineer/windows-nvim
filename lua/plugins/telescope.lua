return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- telescope-fzf-native requires gcc/clang + make
        -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = { ["<C-u>"] = false, ["<C-d>"] = false }
                }
            }
        })
    end
}
