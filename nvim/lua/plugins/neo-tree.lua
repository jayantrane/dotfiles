return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "MunifTanjim/nui.nvim" },
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		--	vim.cmd([[nnoremap / :Neotree toggle current reveal_force_cwd<cr>]])
		--	vim.cmd([[nnoremap | :Neotree reveal<cr>]])
		vim.cmd([[nnoremap <leader>n :Neotree reveal<cr>]])
	end,
}
