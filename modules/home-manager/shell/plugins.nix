{ pkgs, ... }:

{
    programs = {
        starship.enable = true;
        eza.enable = true;
        fzf.enable = true;
        gh.enable = true;
        ripgrep.enable = true;
        tealdeer = {
            enable = true;
            settings = {
                updates.auto_update = true;
            };
        };
        zoxide.enable = true;
    };
}
