# config

### Install scoop and git

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop install git
```

### Clone the repo

```
git clone https://github.com/anekobtw/config.git
cd config
```

## Terminal and font

- **Font - Maple Mono Nerd Font**
  ```
  scoop bucket add nerd-fonts
  scoop install Maple-Mono-NF
  ```

- **Terminal - Windows Terminal**\
  https://github.com/microsoft/terminal
  
  - **Install config**
    
    ```
    Copy-Item -Force terminal/settings.json "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    ```

## Neovim

```
scoop install neovim
Copy-Item -Recurse -Force .\nvim\* "$env:LOCALAPPDATA\nvim"

scoop install nodejs
scoop install stylua
npm install -g prettier
npm install -g vscode-langservers-extracted
nvim +"MasonInstall pyright clangd cssls stylua" +qall
```

## VS Code setup

```
Copy-Item -Force .\vscode\settings.json "$env:APPDATA\Code\User\settings.json"
Get-Content .\vscode\extensions.txt | ForEach-Object { code --install-extension $_ }
```
