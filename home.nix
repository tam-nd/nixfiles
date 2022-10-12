{ config, lib, pkgs, user, ... }:

{
  imports = [
    ./config/hyprland/home.nix
    ./config/rofi/home.nix
    ./config/git/home.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # cli tools
      btop
      neofetch

      # source control
      git

      # browser
      google-chrome
      brave

      # editor
      neovim
      vscode

      # terminal
      alacritty

      # video/audio
      pavucontrol

      # window manager stuff
      rofi-wayland
      waybar

      # programming language management tool
      fnm
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };

    pointerCursor = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 16;
    };

    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "BlexMono Nerd Font Mono";
    };
  };
}
