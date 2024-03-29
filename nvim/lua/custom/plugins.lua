local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- package manager
  use "wbthomason/packer.nvim"

  -- colour scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- cmp plugins
  use "hrsh7th/nvim-cmp"     -- completion plugin
  use "hrsh7th/cmp-buffer"   -- buffer completions
  use "hrsh7th/cmp-path"     -- path completions
  use "hrsh7th/cmp-cmdline"  -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions

  -- snippets
  use "saadparwaiz1/cmp_luasnip"      -- snippet completions
  use "l3mon4d3/luasnip"              -- snippet engine
  use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

  -- lsp
  use "neovim/nvim-lspconfig"
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- LSP diagnostics and code actions

  -- rust specific
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
