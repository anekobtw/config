# Neovim Shortcuts

This file lists the custom shortcuts currently configured in this setup.

## Leader key

- Leader: `<Space>`

## Global keymaps

- `<C-s>` (Normal, Insert): Save current buffer
- `<C-b>` (Normal): Toggle NvimTree
- `<leader>p` (Normal): Open diagnostic float
- `<leader>f` (Normal): Format current file (Conform)

## Plugin keymaps

### Luxterm

- `<C-j>`: Toggle terminal manager

### Comment.nvim (default mappings)

- `gcc` (Normal): Toggle comment on current line
- `gc` + motion (Normal): Toggle comment for a motion
- `gc` (Visual): Toggle comment for selected lines

### nvim-surround (default mappings)

- `ys` + motion + surround (Normal): Add surrounding characters
- `cs` + old + new (Normal): Change surrounding characters
- `ds` + surround (Normal): Delete surrounding characters

## Completion keymaps (nvim-cmp)

These mappings apply while the completion menu is active.

- `<Tab>`: Select next completion item
- `<S-Tab>`: Select previous completion item
- `<CR>`: Confirm selected completion item

