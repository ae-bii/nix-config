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
    file

    ## Misc
    neofetch
    fastfetch
    tree

  ];

  # Enable and configure programs
  programs = {
    yazi = {
      enable = true;
      enableZshIntegration = true;
      theme = {
        manager = {
          cwd = { fg = "#94e2d5"; };
          hovered = { fg = "#1e1e2e"; bg = "#89b4fa"; };
          preview_hovered = { underline = true; };
          find_keyword = { fg = "#f9e2af"; italic = true; };
          find_position = { fg = "#f5c2e7"; bg = "reset"; italic = true; };
          marker_copied = { fg = "#a6e3a1"; bg = "#a6e3a1"; };
          marker_cut=  { fg = "#f38ba8"; bg = "#f38ba8"; };
          marker_selected = { fg = "#89b4fa"; bg = "#89b4fa"; };
          tab_active = { fg = "#1e1e2e"; bg = "#cdd6f4"; };
          tab_inactive = { fg = "#cdd6f4"; bg = "#45475a"; };
          tab_width = 1;
          count_copied = { fg = "#1e1e2e"; bg = "#a6e3a1"; };
          count_cut = { fg = "#1e1e2e"; bg = "#f38ba8"; };
          count_selected = { fg = "#1e1e2e"; bg = "#89b4fa"; };
          border_symbol = "│";
          border_style = { fg = "#7f849c"; };
          syntect_theme = "~/.config/yazi/Catppuccin-mocha.tmTheme";
        };
        status = {
          separator_open  = "";
          separator_close = "";
          separator_style = { fg = "#45475a"; bg = "#45475a"; };
          mode_normal = { fg = "#1e1e2e"; bg = "#89b4fa"; bold = true; };
          mode_select = { fg = "#1e1e2e"; bg = "#a6e3a1"; bold = true; };
          mode_unset  = { fg = "#1e1e2e"; bg = "#f2cdcd"; bold = true; };
          progress_label  = { fg = "#ffffff"; bold = true; };
          progress_normal = { fg = "#89b4fa"; bg = "#45475a"; };
          progress_error  = { fg = "#f38ba8"; bg = "#45475a"; };
          permissions_t = { fg = "#89b4fa"; };
          permissions_r = { fg = "#f9e2af"; };
          permissions_w = { fg = "#f38ba8"; };
          permissions_x = { fg = "#a6e3a1"; };
          permissions_s = { fg = "#7f849c"; };
        };
        input = {
          border   = { fg = "#89b4fa"; };
          title    = {};
          value    = {};
          selected = { reversed = true; };
        };
        select = {
          border   = { fg = "#89b4fa"; };
          active   = { fg = "#f5c2e7"; };
          inactive = {};
        };
        tasks = {
          border  = { fg = "#89b4fa"; };
          title   = {};
          hovered = { underline = true; };
        };
        which = {
          mask            = { bg = "#313244"; };
          cand            = { fg = "#94e2d5"; };
          rest            = { fg = "#9399b2"; };
          desc            = { fg = "#f5c2e7"; };
          separator       = "  ";
          separator_style = { fg = "#585b70"; };
        };
        help = {
          on      = { fg = "#f5c2e7"; };
          exec    = { fg = "#94e2d5"; };
          desc    = { fg = "#9399b2"; };
          hovered = { bg = "#585b70"; bold = true; };
          footer  = { fg = "#45475a"; bg = "#cdd6f4"; };
        };
        filetype = {
          rules = [
            { mime = "image/*"; fg = "#94e2d5"; }
            { mime = "video/*"; fg = "#f9e2af"; }
            { mime = "audio/*"; fg = "#f9e2af"; }
            { mime = "application/zip";             fg = "#f5c2e7"; }
            { mime = "application/gzip";            fg = "#f5c2e7"; }
            { mime = "application/x-tar";           fg = "#f5c2e7"; }
            { mime = "application/x-bzip";          fg = "#f5c2e7"; }
            { mime = "application/x-bzip2";         fg = "#f5c2e7"; }
            { mime = "application/x-7z-compressed"; fg = "#f5c2e7"; }
            { mime = "application/x-rar";           fg = "#f5c2e7"; }
            { name = "*"; fg = "#cdd6f4"; }
            { name = "*/"; fg = "#89b4fa"; }
          ];
        };
      };
    };

    # Move this to nix file under modules
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

    # Move this to nix file under modules
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
