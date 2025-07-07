return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = true,
  keys = {
    { "<leader>fr",  ":FlutterRun<CR>",        { desc = "flutter run" } },
    { "<leader>fdb", ":FlutterDebug<CR>",      { desc = "flutter debug" } },
    { "<leader>fdv", ":FlutterDevices<CR>",    { desc = "flutter devices" } },
    { "<leader>fe",  ":FlutterEmulators<CR>",  { desc = "flutter emulators" } },
    { "<leader>frl", ":FlutterReload<CR>",     { desc = "flutter reload" } },
    { "<leader>frs", ":FlutterRestart<CR>",    { desc = "flutter restart" } },
    { "<leader>fq",  ":FlutterQuit<CR>",       { desc = "flutter quit" } },
    { "<leader>flr", ":FlutterLspRestart<CR>", { desc = "flutter lsp restart" } },
    { "<leader>flc", ":FlutterLogClear<CR>",   { desc = "flutter log clear" } },
    { "<leader>flt", ":FlutterLogToggle<CR>",  { desc = "flutter log toggle" } },
  },
}
