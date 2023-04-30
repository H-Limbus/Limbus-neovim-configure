return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
		{
			'<leader>e',
			'<cmd>Neotree filesystem left toggle dir=F:/ProgramFiles/VimFiles/<CR>',
			desc = 'Explorer NeoTree Toggle',
		},
		{
			'<leader>a',
			'<cmd>Neotree filesystem left reveal dir=F:/ProgramFiles/VimFiles/<CR>',
			desc = 'Explorer NeoTree Reveal',
		},
	},
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = true,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
}