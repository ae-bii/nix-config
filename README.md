<h3 align="center">
 <img src="https://avatars.githubusercontent.com/ae-bii?v=4" width="100" alt="Logo"/><br/>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
 <img src="https://nixos.org/logo/nixos-logo-only-hires.png" height="20" /> <a href="https://github.com/ae-bii">anu's</a> NixOS config 
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
 <a href="https://github.com/ae-bii/nix-config/stargazers"><img src="https://img.shields.io/github/stars/ae-bii/nix-config?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
 <a href="https://github.com/ae-bii/nix-config/commits"><img src="https://img.shields.io/github/last-commit/ae-bii/nix-config?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
</p>

hello! in this repo, you'll find all of the files for my NixOS config.

## table of contents

1. [pruned file tree](#pruned-file-tree)
2. [getting started](#getting-started)
3. [screenshots](#screenshots)
4. [todo](#todo)

## pruned file tree
```
.
├── home-manager
├── misc
├── modules
│   ├── home-manager
│   │   ├── hyprland
│   │   ├── neovim
│   │   │   └── nvim
│   └── nixos
├── nixos
├── overlays
├── pkgs
└── waybar
```

## getting started

### install
```bash
cd ~
git clone https://github.com/ae-bii/nix-config.git
cd ~/nix-config
sudo nixos-rebuild switch --flake .#zero
```

## screenshots
![Desktop](misc/assets/plain_desktop.png)
![Neofetch](misc/assets/neofetch.png)

## todo
- [x] move hyprland conf to home.nix
- [ ] move fuzzel conf to home.nix
- [x] move mako conf to home.nix
- [x] add clipboard
- [ ] add screenlock
- [ ] sync colors across entire config
- [ ] add hosts
