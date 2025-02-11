{
  description = "monstro nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let 
    # https://mynixos.com/nix-darwin/options
    configuration = { pkgs, config, ... }: {
      nix.settings.experimental-features = "nix-command flakes";

      nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin";
      };

      # https://search.nixos.org/packages
      environment.systemPackages =
        [
          pkgs.zsh
          pkgs.stow
          pkgs.fzf
          pkgs.bat
          pkgs.htop
          pkgs.mas
          pkgs.bun
          pkgs.git
          pkgs.lazydocker
          pkgs.lazygit
          pkgs.awscli2
          pkgs.neovim
          pkgs.granted
        ];

      # https://formulae.brew.sh/
      homebrew = {
        enable = true;
        brews = [
          "nvm"
          "starship"
          "fastfetch"
        ];
        casks = [
          "steam"
          "nordvpn"
          "discord"
          "alt-tab"
          "ghostty"
          "docker"
          "chatgpt"
          "postman"
          "google-chrome"
          "microsoft-edge"
          "visual-studio-code"
          "the-unarchiver"
          "notion-calendar"
          "raycast"
          "spotify"
          "obs"
        ];
        masApps = {
          "Signal Shifter" = 6446061552;
          "WhatsApp" = 310633997;
          "Amphetamine" = 937984704;
          "Windows" = 1295203466;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      programs = {
        zsh.enable = true;
        tmux.enable = true;
      };

      # https://mynixos.com/nix-darwin/options/system.defaults
      system = {
        stateVersion = 5;
        configurationRevision = self.rev or self.dirtyRev or null;
        defaults = {
          dock.autohide = true;
          dock.show-recents = false;
          dock.minimize-to-application = true;
          dock.mineffect = "scale";
          dock.appswitcher-all-displays = true;
          dock.wvous-bl-corner = 14;
          dock.persistent-apps = [
            "/Applications/Ghostty.app"
            "/Applications/Visual Studio Code.app"
            "/Applications/Notion Calendar.app"
            "/System/Applications/Notes.app"
            "/System/Applications/iPhone Mirroring.app"
            "/Applications/Windows App.app"
            "/Applications/Microsoft Edge.app"
          ];
          dock.persistent-others = [
            "/Users/gabriel/git"
          ];
          finder.NewWindowTarget = "Home";
          finder.AppleShowAllExtensions = true;
          finder.AppleShowAllFiles = true;
          finder.QuitMenuItem = true;
          finder.ShowPathbar = true;
          finder.FXPreferredViewStyle = "clmv";
          finder._FXSortFoldersFirst = true;
          finder._FXSortFoldersFirstOnDesktop = true;
          loginwindow.GuestEnabled = false;
          controlcenter.BatteryShowPercentage = true;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.KeyRepeat = 2;
          NSGlobalDomain."com.apple.keyboard.fnState" = true;
          NSGlobalDomain.AppleShowAllExtensions = true;
          NSGlobalDomain.AppleShowAllFiles = true;
        };
      };
    };
  in
  {
    darwinConfigurations."monstro" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "gabriel";
          };
        }
      ];
    };
  };
}
