local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify(nvim_tree, vim.log.levels.ERROR)
  return
end

local function on_attach(bufnr)
  local api_status_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
  if not api_status_ok then
    vim.notify(nvim_tree, vim.log.levels.ERROR)
    return
  end

  local function opts (desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  nvim_tree_api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<CR>',  nvim_tree_api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'l',     nvim_tree_api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'o',     nvim_tree_api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'h',     nvim_tree_api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', 'v',     nvim_tree_api.node.open.vertical,                opts('Open: Vertical Split'))
end

local tree_opts = {
  on_attach = on_attach,
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 40,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}

nvim_tree.setup(tree_opts)
