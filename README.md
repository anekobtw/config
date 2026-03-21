# config

## Stack and highlights

### Terminal and font

- Terminal: [Windows Terminal](https://github.com/microsoft/terminal)
- Font: [Maple Mono Nerd Font](https://github.com/subframe7536/maple-font)

Install Maple Mono via Scoop:

```powershell
scoop bucket add nerd-fonts
scoop install Maple-Mono-NF
```

### Neovim

Default installed LSP servers/tools:

- `pyright`
- `clangd`
- `ts_ls`
- `stylua`

Configured formatters:

- C/C++: `clang-format`
- Lua: `stylua`
- Python: `black`, `isort`
- JS/TS/HTML/CSS/JSON: `prettier`

#### Keymaps

- `Ctrl+s`: save file (normal/insert)
- `Ctrl+b`: toggle file tree
- `<leader>p`: diagnostic float
- `<leader>f`: format current file
- `Ctrl+j`: open/toggle Luxterm manager

#### Install

```powershell
git clone https://github.com/anekobtw/nvim-config.git
cd nvim-config
Copy-Item -Recurse -Force .\nvim "$env:LOCALAPPDATA\nvim"
```

### VS Code setup

```powershell
Copy-Item -Force .\vscode\settings.json "$env:APPDATA\Code\User\settings.json"
Get-Content .\vscode\extensions.txt | ForEach-Object { code --install-extension $_ }
```
