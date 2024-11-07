-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- run python code
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":CloseOtherWindowsAndBuffers<CR>:w<CR>:vsplit | terminal python3 %<CR><C-w>h",
  { noremap = true, silent = true }
)

-- Remap to use leader key for switching windows
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>l", { noremap = true, silent = true })

-- line length for tex files
vim.api.nvim_create_augroup("TexFileSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.textwidth = 80 -- Change 80 to your desired line length
    vim.opt_local.wrap = true -- Enable line wrapping (optional)
  end,
})

vim.api.nvim_create_user_command("CloseOtherWindowsAndBuffers", function()
  -- Get the current window and buffer IDs
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Close all other windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current_win then
      vim.api.nvim_win_close(win, false) -- Close without force
    end
  end

  -- Close all buffers except the current one
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true }) -- Force delete buffer
    end
  end
end, {
  desc = "Close all other windows and buffers except the current one.",
})
