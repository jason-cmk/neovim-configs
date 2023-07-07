require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
      ignore = false
  },
  view = {
      width = 40
  }
})

vim.keymap.set({"n", "v"}, "<leader>pv", ":NvimTreeToggle<cr>", { desc = '[P]roject [v]iew explorer' })
vim.keymap.set({"n", "v"}, "<leader>ph", ":NvimTreeFindFile<cr>", { desc = '[P]roject explorer [h]ere' })
