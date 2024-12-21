return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-p>"] = layout.toggle_preview,
					},
				},
				preview = {
					hide_on_startup = true,
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				git_files = {
					show_untracked = true,
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files in cwd" })
		keymap.set("n", "<leader>fn", "<cmd>Telescope git_status<cr>", { desc = "List git new and modified files" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set(
			"n",
			"<leader>fl",
			"<cmd>Telescope lsp_document_symbols ignore_symbols=variable<cr>",
			{ desc = "List functions and classes" }
		)
		keymap.set(
			"n",
			"<leader>fdd",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			{ desc = "List diagnostics for current file" }
		)
		keymap.set("n", "<leader>fdw", "<cmd>Telescope diagnostics<cr>", { desc = "List workspace diagnostics" })
	end,
}
