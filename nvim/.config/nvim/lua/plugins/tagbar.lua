return {
  "preservim/tagbar",
  config = function()
    vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { desc = "tagbar" })
  end,
}
