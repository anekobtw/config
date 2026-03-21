require("config.lazy")

-- ========= BASIC OPTIONS =========
vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd.colorscheme("catppuccin-macchiato")

-- ========= KEYMAPS =========
vim.keymap.set({ "n", "i" }, "<C-s>", function()
	if vim.bo.modifiable then
		vim.cmd.write()
	end
end, { silent = true })

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- ========= TERMINAL =========
require("luxterm").setup({
	manager_width = 0.8,
	manager_height = 0.8,
	preview_enabled = true,
	auto_hide = true,
	keymaps = {
		toggle_manager = "<C-j>",
	},
})

-- ========= STATUSLINE =========
require("lualine").setup({
	options = { theme = "catppuccin-macchiato" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {
			function()
				return " " .. os.date("%I:%M %p")
			end,
		},
		lualine_z = { "location" },
	},
})

-- ========= FILE TREE =========
require("nvim-tree").setup({
	view = { width = 15 },
})

-- ========= MASON =========
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "clangd", "ts_ls", "stylua" },
})

-- ========= LSP + CMP =========
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("ts_ls", { capabilities = capabilities })

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("ts_ls")

-- ========= AUTOCOMPLETE =========
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

-- ========= FORMATTER =========
require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		python = { "black", "isort" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
	},
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format file" })

-- ========= LINE NUMBER COLORS =========
local palette = require("catppuccin.palettes").get_palette()

require("line-number-change-mode").setup({
	mode = {
		n = { fg = palette.blue },
		i = { fg = palette.green },
		v = { fg = palette.mauve },
		V = { fg = palette.mauve },
		R = { fg = palette.maroon },
	},
})
