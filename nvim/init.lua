require("config.lazy")

vim.opt.cursorline = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.o.completeopt = "menuone,noselect"
vim.cmd([[colorscheme catppuccin-mocha]])

-- save on ctrl + s
vim.keymap.set({ "n", "i" }, "<C-s>", function()
	if vim.bo.modifiable then
		vim.cmd("write")
	end
end, { silent = true })

-- explorer on ctrl + b
vim.keymap.set({ "n" }, "<C-b>", function()
	vim.cmd("NvimTreeToggle")
end, { silent = true })

-- terminal on ctrl + j
require("luxterm").setup({
	manager_width = 0.8,
	manager_height = 0.8,
	preview_enabled = true,
	auto_hide = true,
	keymaps = {
		toggle_manager = "<C-j>",
	},
})

-- autocomplete
--   next on tab
--   prev on shift + tab
--   accept on enter
local opts = { expr = true, silent = true }

vim.keymap.set("i", "<Tab>", function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn
	elseif vim.fn["coc#expandable"]() == 1 then
		return vim.fn["coc#expandable"]() and vim.fn["coc#expand"]() or "<Tab>"
	else
		return "<Tab>"
	end
end, opts)

vim.keymap.set("i", "<S-Tab>", function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn
	elseif vim.fn["coc#jumpable"]() == 1 then
		return vim.fn["coc#jumpable"]() and vim.fn["coc#jump"](-1) or "<S-Tab>"
	else
		return "<S-Tab>"
	end
end, opts)

vim.keymap.set("i", "<CR>", function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn["coc#pum#confirm"]()
	else
		return "\n"
	end
end, opts)

-- lualine config
require("lualine").setup({
	options = { theme = "catppucin" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {
			function()
				return "  " .. os.date("%I:%M %p")
			end,
		},
		lualine_z = { "location" },
	},
})

-- nvim-tree config
require("nvim-tree").setup({
	view = {
		width = 15,
	},
})

-- lsp config
require("cmp_nvim_lsp").default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "stylua", "clangd", "ts_ls" },
})

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("stylua")
vim.lsp.enable("ts_ls")
vim.lsp.enable("prettier")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
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

-- line numbers config
local palette = require("catppuccin.palettes").get_palette()

require("line-number-change-mode").setup({
	mode = {
		i = { fg = palette.green },
		n = { fg = palette.blue },
		R = { fg = palette.maroon },
		v = { fg = palette.mauve },
		V = { fg = palette.mauve },
	},
})

