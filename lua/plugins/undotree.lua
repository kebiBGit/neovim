return {
    "mbbill/undotree",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.o.undofile= true;
        vim.keymap.set('n', '<C-u>', ':UndotreeToggle<CR>')
    end,
}

