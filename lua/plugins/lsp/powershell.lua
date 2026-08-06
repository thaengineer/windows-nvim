return {
  "TheLeoP/powershell.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
      require("powershell").setup({
          bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
          shell = "powershell.exe",
          shell_flags = { "-NoLogo", "-NoProfile", "-ExecutionPolicy", "Bypass" },
          cmd = { "powershell.exe", "-NoLogo", "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command" },
          settings = {
              powershell = {
                  codeFormatting = { Preset = 'OTBS' },
                  scriptAnalysis = { enable = true },
              },
          },
          on_attach = function(client, bufnr)
              local bufopts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
              vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          end
      })
  end
}
