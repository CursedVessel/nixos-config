{ config, pkgs, ... }:

{
  home.username = "cosmic";
  home.homeDirectory = "/home/cosmic";
  home.stateVersion = "24.05"; 

  # 1. Shell & Terminals (Zsh + Starship)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .";
      garbage = "nix-collect-garbage -d";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  # 2. Git Configuration
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Hunter Welch";
        email = "hxnterwelch@icloud.com";
      };
    };
  };

  # 3. Development Tools
  home.packages = with pkgs; [
    # Rust
    rustup       # Provides cargo, rustc, AND rust-analyzer shims.
    gcc          # Linker needed for Rust
    
    # Swift
    swift
    sourcekit-lsp
    
    # Nix Tools
    nixd
    nil

    # CLI Utils
    eza
    bat
    ripgrep
    fzf
  ];

  # 4. Wallpapers Symlink
  home.file."Pictures/Wallpapers".source = ./Wallpapers;
}
