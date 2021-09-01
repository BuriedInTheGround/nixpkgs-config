{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = ~/Music;
    extraConfig = ''
      audio_output {
        type            "pulse"
        name            "pulse audio"
      }

      audio_output {
        type            "fifo"
        name            "my_fifo"
        path            "/tmp/mpd.fifo"
        format          "44100:16:2"
      }

      log_level                   "verbose"
      auto_update                 "yes"
      auto_update_depth           "3"
      follow_outside_symlinks     "yes"
      follow_inside_symlinks      "yes"
    '';
  };
}
