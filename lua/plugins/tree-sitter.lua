vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "nvim-treesitter",
  desc = "Run :TSUpdate after pack changed",
  group = vim.api.nvim_create_augroup("treesitter_update", { clear = true }),
  callback = function(e)
    local kind, name = e.data.kind, e.data.spec.name
    if kind == "install" or kind == "update" then
      vim.cmd.packadd({ args = { name }, bang = false })
      vim.cmd("TSUpdate")
    end
  end,
})

local parsers = {
  "lua",
  "vim",
  "vimdoc",
  "bash",
  "c",
  "cpp",
  "python",
  "latex",
  "typst",
  "regex",
  "javascript",
  "typescript",
  "json",
  "html",
  "css",
  "markdown",
  "markdown_inline",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function(e)
    vim.treesitter.start(e.buf)
    vim.bo[e.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
