# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    outputs.homeManagerModules.tmux
    outputs.homeManagerModules.zellij
    outputs.homeManagerModules.git

    outputs.homeManagerModules.shell
    outputs.homeManagerModules.neovim


    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.default.additions
      outputs.overlays.default.modifications
      outputs.overlays.default.unstable-packages

      # You can also add overlays exported from other flakes:
      outputs.overlays.neovim-nightly-overlay

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Set your username
  home = {
    username = "anu";
    homeDirectory = "/home/anu";
  };

  # Add stuff for your user as you see fit:
  # Packages that should be installed to the user profile.
  # TODO: Maybe change the packages from here to just enables in programs?
  home.packages = with pkgs; [

    ## Shells
    # zsh

    ## Shell Level Up
    bat
    # eza
    # fd
    # fzf
    # gh
    lazygit
    # oh-my-zsh
    # pure-prompt
    # starship
    # tealdeer
    unzip
    # zoxide

    ## Terminals
    # kitty

    ## Fonts
    (nerdfonts.override { fonts = [
        "FiraCode"
    ];})

    ## Browsers
    firefox

    ## Messaging / Social
    discord-canary
    slack

    ## Music
    spotify

    ## Text Editors
    kate
    # vscode

    ## Development
    # gcc-unwrapped
    # go
    # lua
    # lua54Packages.jsregexp
    # stylua
    # nodejs_21
    # (python311.withPackages (p: with p; [
    #   pip
    #   autopep8
    #   black
    #   isort
    #   dbus-python
    #   pynvim
    # ]))
    # prettierd
    # rustup
    # texlive.combined.scheme-full

    ## Version Control
    # git

    ## Diagnostics
    activitywatch
    btop

    ## Utilities
    # zathura

    ## Misc
    neofetch

  ];

  # Enable and configure programs
  programs = {
    kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
      font = {
        name = "FiraCode Nerd Font Mono";
        size = 11;
      };
      settings = {
        enable_audio_bell = false;
      };
    };

    vscode = {
      enable = true;
    };

    zathura = {
      enable = true;
      extraConfig = ''
        set selection-clipboard clipboard
        set guioptions ""

        map D set "first-page-column 1:1"
        map <C-d> set "first-page-column 1:2"
        map t toggle_statusbar
        '';
    };

  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
