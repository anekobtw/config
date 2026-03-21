# config

## Terminal and font

- Terminal: [Windows Terminal](https://github.com/microsoft/terminal)
- Font: [Maple Mono Nerd Font](https://github.com/subframe7536/maple-font)

Install Maple Mono via Scoop:

```
scoop bucket add nerd-fonts
scoop install Maple-Mono-NF
```

## Neovim

### Keymaps

- `Ctrl+s`: save file (normal/insert)
- `Ctrl+b`: toggle file tree
- `<leader>p`: diagnostic float
- `<leader>f`: format current file
- `Ctrl+j`: open/toggle Luxterm manager

### Install

```
git clone https://github.com/anekobtw/nvim-config.git
cd nvim-config
Copy-Item -Recurse -Force .\nvim "$env:LOCALAPPDATA\nvim"
```

## VS Code setup

```
Copy-Item -Force .\vscode\settings.json "$env:APPDATA\Code\User\settings.json"
Get-Content .\vscode\extensions.txt | ForEach-Object { code --install-extension $_ }
```
