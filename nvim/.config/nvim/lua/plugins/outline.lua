return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen", "ClassMethods" },
	keys = {
		{ "<leader>co", "<cmd>Outline<CR>", desc = "Toggle outline symbols" },
		{ "<leader>cm", "<cmd>ClassMethods<CR>", desc = "List class methods" },
	},
	opts = {},
	config = function()
		require("outline").setup({})

		-- Custom command to list methods of the current class
		vim.api.nvim_create_user_command("ClassMethods", function()
			-- Get the current document
			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			local cursor_line = cursor_pos[1] - 1

			-- Use LSP directly to get symbols
			local params = vim.lsp.util.make_position_params()
			vim.lsp.buf_request(0, "textDocument/documentSymbol", params, function(err, result, _, _)
				if err or not result or vim.tbl_isempty(result) then
					vim.notify("No symbols found in this document", vim.log.levels.WARN)
					return
				end

				-- Flatten symbols into an easier structure to work with
				local symbols = result[1].result or result

				-- Find the current class based on cursor position
				local current_class = nil
				local class_methods = {}

				-- Recursive function to find the class containing the cursor
				local function find_class_at_cursor(syms)
					for _, sym in ipairs(syms) do
						local start_line = sym.range and sym.range.start.line or sym.selectionRange.start.line
						local end_line = sym.range and sym.range["end"].line or sym.selectionRange["end"].line

						-- If it's a class and the cursor is inside it
						if sym.kind == 5 and cursor_line >= start_line and cursor_line <= end_line then
							current_class = sym
							-- Look for methods in the children
							if sym.children then
								for _, child in ipairs(sym.children) do
									if child.kind == 6 then -- 6 is the code for methods
										table.insert(class_methods, {
											name = child.name,
											line = (
												child.range and child.range.start.line
												or child.selectionRange.start.line
											) + 1,
											detail = child.detail or "",
										})
									end
								end
							end
							return true
						end

						-- Search recursively in children
						if sym.children and #sym.children > 0 then
							if find_class_at_cursor(sym.children) then
								return true
							end
						end
					end
					return false
				end

				find_class_at_cursor(symbols)

				if current_class and #class_methods > 0 then
					-- Display methods with Telescope
					local pickers = require("telescope.pickers")
					local finders = require("telescope.finders")
					local conf = require("telescope.config").values
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")

					pickers
						.new({}, {
							prompt_title = "Methods of " .. current_class.name,
							finder = finders.new_table({
								results = class_methods,
								entry_maker = function(entry)
									return {
										value = entry,
										display = entry.name,
										ordinal = entry.name,
										lnum = entry.line,
									}
								end,
							}),
							sorter = conf.generic_sorter({}),
							attach_mappings = function(prompt_bufnr, map)
								actions.select_default:replace(function()
									local selection = action_state.get_selected_entry()
									actions.close(prompt_bufnr)
									vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
								end)
								return true
							end,
						})
						:find()
				else
					vim.notify("No methods found for the class under cursor", vim.log.levels.INFO)
				end
			end)
		end, {})

		-- Make sure to load the Telescope extension if available
		pcall(function()
			require("telescope").load_extension("outline")
		end)
	end,
}
