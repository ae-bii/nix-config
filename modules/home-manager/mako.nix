{ config, pkgs, lib, ... }:

{
    services.mako = {
        enable = true;
        package = pkgs.unstable.mako;
        extraConfig = ''
            # Colors
            background-color=#303446
            text-color=#c6d0f5
            border-color=#cba6f7ff
            border-radius=10
            progress-color=over #414559

            [urgency=high]
            border-color=#ef9f76

            # == Mode: Away ==
            [mode=away]
            default-timeout=0
            ignore-timeout=1

            # == Mode: Do Not Disturb ==
            [mode=do-not-disturb]
            invisible=1
        '';
    };
}
