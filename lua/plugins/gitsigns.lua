return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "±" },
            delete = { text = "-" },
        },
        current_line_blame = true,
        numhl = false,
        linehl = false,
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
            end

            vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
            vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
            --vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = '#756515' })

            map('n', '<leader>ghr', gs.reset_hunk)
            map('v', '<leader>ghr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('n', '<leader>ghp', gs.preview_hunk)
        end
      }
}
