return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      -- Use correct option and ensure your servers are present
      automatic_installation = true,
      ensure_installed = { "lua_ls", "html" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local ok_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if ok_cmp and cmp and cmp.default_capabilities then
        capabilities = cmp.default_capabilities(capabilities)
      end

      -- Override defaults and enable via core API (Nvim 0.11+)
      vim.lsp.config('html',       { capabilities = capabilities })
      vim.lsp.config('lua_ls',     { capabilities = capabilities })

      vim.lsp.enable('html')
      vim.lsp.enable('lua_ls')

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}