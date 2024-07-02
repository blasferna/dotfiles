return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		transparent = true, -- change to true for transparency, it doesn't work now.
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors) end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors) end,
	},
	config = function(_, opts)
		vim.cmd("colorscheme tokyonight")

		-- I don't sure about the next lines.
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		tokyonight.load()
	end,
}
