-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Theme
	use { 
		"catppuccin/nvim", 
		as = "catppuccin", 
		config = function() 
			vim.cmd('colorscheme catppuccin')
		end 
	}
end)
