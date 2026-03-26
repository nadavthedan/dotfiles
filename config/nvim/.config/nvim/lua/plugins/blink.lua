return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- keep existing options
      opts = opts or {}

      -- Remap C-n to trigger completion manually
      opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
        ["<C-n>"] = { "show", "select_next" }, -- open completion + move to next
        ["<C-p>"] = { "select_prev" }, -- optional: move previous
        -- ["<C-Space>"] = false, -- disable the default trigger
      })

      return opts
    end,
  },
}
