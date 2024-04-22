# anu's neovim config

## Installation

> [!IMPORTANT]
> Make sure Neovim 0.9+ is installed along with the external dependencies:
> - Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
> - [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
> - A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
> - if you have it set `vim.g.have_nerd_font` in `init.lua` to true


Clone the repository based on your OS:

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/ae-bii/nix-config.git
mv nix-config/modules/home-manager/neovim/nvim/* "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
rm -rf nix-config/
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/ae-bii/nix-config.git
move .\nix-config\modules\home-manager\neovim\nvim\* %userprofile%\AppData\Local\nvim\
rmdir nix-config
```

If you're using `powershell.exe`

```
git clone https://github.com/ae-bii/nix-config.git
Move-Item -Path .\nix-config\modules\home-manager\neovim\nvim\* -Destination $env:USERPROFILE\AppData\Local\nvim\
Remove-Item -Path .\nix-config\ -Recurse
```

</details>

After installation, you can start Neovim by doing:
```sh
nvim
```

## Plugins

### TODO: List of plugins

