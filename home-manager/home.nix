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

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

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
    gcc-unwrapped
    (python311.withPackages (p: with p; [
      dbus-python
    ]))
    python311Packages.pip
    python311Packages.autopep8
    python311Packages.black
    python311Packages.isort
    rustup
    texlive.combined.scheme-full

    ## Version Control
    # git

    ## Diagnostics
    btop

    ## Misc
    neofetch

  ];

  # Enable and configure programs
  programs = {
    kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
      settings = {
        enable_audio_bell = false;
      };
    };

    starship = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "ae-bii";
      userEmail = "anupambhakta1@gmail.com";
      extraConfig = {
        init.defaultBranch = "master";
        credential.helper = "oauth";
      };
    };

    eza.enable = true;
    fzf.enable = true;
    gh.enable = true;
    tealdeer = {
      enable = true;
      settings = {
        updates.auto_update = true;
      };
    };
    zoxide.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        cat = "bat";
        lg = "lazygit";
        ls = "eza";
        ll = "eza -l";
        nixtest = "sudo nixos-rebuild test --flake /home/anu/nix-config#zero";
        tldr = "tealdeer";
        update = "sudo nixos-rebuild switch --flake /home/anu/nix-config#zero";
      };
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "";
      };

#        autoload -U promptinit; promptinit
#        prompt pure


      initExtra = ''
        eval "$(zoxide init --cmd cd zsh)"
      '';
    };

    neovim = {
      defaultEditor = true;
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
        catppuccin-nvim
        mini-nvim
      ];
      extraLuaConfig = ''
        vim.wo.number = true
        vim.wo.relativenumber = true
		vim.opt.expandtab = true
        vim.opt.tabstop = 4
	    vim.opt.softtabstop = 4
	    vim.opt.shiftwidth = 4

        vim.o.termguicolors = true
        vim.cmd('colorscheme catppuccin-mocha')
      '';
    };

    vscode = {
      enable = true;
    };

  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
