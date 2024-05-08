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
    outputs.homeManagerModules.mako

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
    fira
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [
        "NerdFontsSymbolsOnly"
        "FiraCode"
        "JetBrainsMono"
        "Hack"
    ];})

    ## Browsers
    firefox

    ## Messaging / Social
    # discord-canary
    unstable.webcord
    slack
    unstable.zoom-us

    ## Music
    spotify
    audacity

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
    psmisc
    # noisetorch

    ## Misc
    neofetch
    fastfetch
    tree

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
        confirm_os_window_close = 2;
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

        set default-fg                rgba(205,214,244,1)
        set default-bg 			          rgba(30,30,46,1)

        set completion-bg		          rgba(49,50,68,1)
        set completion-fg		          rgba(205,214,244,1)
        set completion-highlight-bg	  rgba(87,82,104,1)
        set completion-highlight-fg	  rgba(205,214,244,1)
        set completion-group-bg		    rgba(49,50,68,1)
        set completion-group-fg		    rgba(137,180,250,1)

        set statusbar-fg		          rgba(205,214,244,1)
        set statusbar-bg		          rgba(49,50,68,1)

        set notification-bg		        rgba(49,50,68,1)
        set notification-fg		        rgba(205,214,244,1)
        set notification-error-bg	    rgba(49,50,68,1)
        set notification-error-fg	    rgba(243,139,168,1)
        set notification-warning-bg	  rgba(49,50,68,1)
        set notification-warning-fg	  rgba(250,227,176,1)

        set inputbar-fg			          rgba(205,214,244,1)
        set inputbar-bg 		          rgba(49,50,68,1)

        set recolor                   "true"
        set recolor-lightcolor		    rgba(30,30,46,1)
        set recolor-darkcolor		      rgba(205,214,244,1)

        set index-fg			            rgba(205,214,244,1)
        set index-bg			            rgba(30,30,46,1)
        set index-active-fg		        rgba(205,214,244,1)
        set index-active-bg		        rgba(49,50,68,1)

        set render-loading-bg		      rgba(30,30,46,1)
        set render-loading-fg		      rgba(205,214,244,1)

        set highlight-color		        rgba(87,82,104,0.5)
        set highlight-fg              rgba(245,194,231,0.5)
        set highlight-active-color	  rgba(245,194,231,0.5)
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
