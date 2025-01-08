return {
	'theprimeagen/harpoon',
	config = function()
		require('harpoon').setup()
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		local function nav_file(index)
			return function()
				ui.nav_file(index)
			end
		end

		vim.keymap.set('n', '<leader>a', mark.add_file)
		vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
		vim.keymap.set('n', '<C-h>', nav_file(1))
		vim.keymap.set('n', '<C-j>', nav_file(2))
		vim.keymap.set('n', '<C-k>', nav_file(3))
		vim.keymap.set('n', '<C-l>', nav_file(4))
	end
}

