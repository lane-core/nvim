-- MAPPINGS

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', "\\e", vim.diagnostic.open_float)
vim.keymap.set('n', "[d", vim.diagnostic.goto_prev)
vim.keymap.set('n', "]d", vim.diagnostic.goto_next)
vim.keymap.set('n', "\\q", vim.diagnostic.setloclist)

vim.keymap.set('n', '<C-_>', ":Telescope<cr>")

-- Move to window using the movement keys
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

-- Agda-mode
-- vim.keymap.set('i', '<leader>', e)
--vim.keymap.set("i", "<leader>U", "𝓤")
--vim.keymap.set("i", "<leader>V", "𝓥")
--vim.keymap.set("i", "<leader>W", "𝓦")
--vim.keymap.set("i", "<leader>Eq", "? ＝⟨ ? ⟩<CR>")
--vim.keymap.set("i", "<leader>qed", "∎")
--vim.keymap.set("i", "<leader><", "⟨")
--vim.keymap.set("i", "<leader>>", "⟩")
--vim.keymap.set("i", "<leader>L", "λ")
--vim.keymap.set("i", "<leader>^1", "¹")
--vim.keymap.set("i", "<leader>^-", "-")
--vim.keymap.set("i", "<leader>a", "α")
--vim.keymap.set("i", "<leader>b", "β")
--vim.keymap.set("i", "<leader>g", "γ")
--vim.keymap.set("i", "<leader>G", "Γ")
--vim.keymap.set("i", "<leader>d", "δ")
--vim.keymap.set("i", "<leader>D", "Δ")
--vim.keymap.set("i", "<leader>s", "σ")
--vim.keymap.set("i", "<leader>S", "Σ")
--vim.keymap.set("i", "<leader>p", "ϕ")
--vim.keymap.set("i", "<leader>c", "χ")
--vim.keymap.set("i", "<leader>z", "ζ")
--vim.keymap.set("i", "<leader>x", "ξ")
--vim.keymap.set("i", "<leader>^.", " ̇")
--vim.keymap.set("i", "<leader>=", "＝")
--vim.keymap.set("i", "<leader>.", "∙")
--vim.keymap.set("i", "<leader>:", "꞉")
--vim.keymap.set("i", "<leader>|", "∣")
--vim.keymap.set("i", "<leader>l", "←")
--vim.keymap.set("i", "<leader>r", "→")
