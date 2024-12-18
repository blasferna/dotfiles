return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		defaul_file_explorer = true,
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		win_options = {
			winbar = "%{v:lua.require('oil').get_current_dir()}",
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		},
	},
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
