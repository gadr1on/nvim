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

return require('packer').startup(function()
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')
  use "akinsho/bufferline.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  -- use "moll/vim-bbye"

  -- Telescope
  use('nvim-telescope/telescope.nvim')
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use('lewis6991/gitsigns.nvim')

  -- Comments
  use('numToStr/Comment.nvim')

  -- Cmp Plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- UI Plugins
  use('nvim-lualine/lualine.nvim') -- Bottom info line
  use 'kyazdani42/nvim-tree.lua'
  use('kyazdani42/nvim-web-devicons')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')

  -- Theme
  use "morhetz/gruvbox"

   -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
