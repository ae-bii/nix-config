# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
    # List your module files here
    # my-module = import ./my-module.nix;
    mako = import ./mako.nix;

    git = import ./git/default.nix;
    tmux = import ./tmux.nix;
    zellij = import ./zellij/default.nix;

    neovim = import ./neovim/default.nix;
    shell = import ./shell/default.nix;
}
