# config

## Clone the repo

```
git clone https://github.com/anekobtw/config.git
cd config
```

## Install scoop

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Terminal and font

- **Terminal**\
  Windows Terminal\
  https://github.com/microsoft/terminal

- **Font**\
  Maple Mono Nerd Font\
  https://github.com/subframe7536/maple-font
  - **Installing font**

    ```
    scoop install git
    scoop bucket add nerd-fonts
    scoop install Maple-Mono-NF
    ```

## Neovim

```
scoop install neovim
Copy-Item -Recurse -Force .\nvim\* "$env:LOCALAPPDATA\nvim"

# required for lsp
scoop install nodejs
node -v
npm -v
nvim +"MasonInstall pyright typescript-language-server" +qall
```

## VS Code setup

```
Copy-Item -Force .\vscode\settings.json "$env:APPDATA\Code\User\settings.json"
Get-Content .\vscode\extensions.txt | ForEach-Object { code --install-extension $_ }
```
