return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      window = {
        position = "left",
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          visible = true,
          hide_dot_files = false,
          hide_gitignored = false
        }
      },
      components = {
        icon = function(config, node, state)
          local icon = config.default or " "
          local padding = config.padding or " "
          local highlight = config.highlight or highlights.FILE_ICON

          if node.type == "directory" then
            highlight = highlights.DIRECTORY_ICON
            if node:is_expanded() then
              icon = config.folder_open or "-"
            else
              icon = config.folder_closed or "+"
            end
          elseif node.type == "file" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            if success then
              local devicon, hl = web_devicons.get_icon(node.name, node.ext)
              icon = devicon or icon
              highlight = hl or highlight
            end
          end

          return {
            text = icon .. padding,
            highlight = highlight,
          }
        end,
      }
    }
  }
}
