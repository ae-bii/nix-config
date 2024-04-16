{ config, pkgs, lib, ... }:

{
    imports = [
        ./plugins.nix
    ];
    programs.zsh = {
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


        initExtra = ''
            eval "$(zoxide init --cmd cd zsh)"
        '';
    };
}
