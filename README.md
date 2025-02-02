https://www.youtube.com/watch?v=Z8BL8mdzWHI&ab_channel=DreamsofAutonomy

sudo scutil --set ComputerName "mypc"
sudo scutil --set HostName "mypc"
sudo scutil --set LocalHostName "mypc"

mkdir ~/Developer

xcode-select --install

sh <(curl -L https://nixos.org/nix/install)

nix-shell -p neofetch —run neofetch

mkdir nix
cd nix
mkdir ~/.config/nix
nix flake init -t nix-darwin --extra-experimental-features "nix-command flakes"

sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#mypc

which darwin-rebuild

darwin-rebuild switch --flake ~/nix#mypc

https://search.nixos.org/packages

https://mynixos.com/nix-darwin/options

darwin-rebuild switch --flake ~/Developer/dotfiles#monstro

---

nix-channel --update
nix flake update
darwin-rebuild switch --flake ./#monstro

---

mkdir ~/.ssh
ssh-keygen -t rsa -C "primary-email@example.com" -f ~/.ssh/id_rsa_primary
ssh-keygen -t rsa -C "secondary-email@example.com" -f ~/.ssh/id_rsa_secondary

---

# necessary for raycast, should be done on home-manager

          # # Disable Command + Space for Spotlight
          # "com.apple.symbolichotkeys" = {
          #   AppleSymbolicHotKeys = {
          #     "64" = {
          #       enabled = false;
          #     };
          #     "65" = {
          #       enabled = false;
          #     };
          #   };
          # };

          --------

git clone git@github.primary:semnome027/app.git

darwin-rebuild switch --flake ~/Developer/gnllucena/dotfiles#monstro

---

stow --adopt . #overrides exisitn files
