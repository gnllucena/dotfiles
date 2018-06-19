# Fedora 28
Run these commands using /bin/bash


# Updating Fedora

	$ sudo dnf update

	$ sudo dnf upgrade

# Installing development tools
### fish shell
> <a href="https://github.com/fish-shell/fish-shell">fish</a> is a smart and user-friendly command line shell for macOS, Linux, and the rest of the family. fish includes features like syntax highlighting, autosuggest-as-you-type, and fancy tab completions that just work, with no configuration required.

	$ sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_27/shells:fish:release:2.repo

	$ sudo dnf install fish
> <a href="https://github.com/oh-my-fish/oh-my-fish">Oh My Fish</a> provides core infrastructure to allow you to install packages which extend or modify the look of your shell. It's fast, extensible and easy to use.

	$ curl -L https://get.oh-my.fish | fish

> Plugin for Oh My Fish that brings <a href="https://github.com/oh-my-fish/plugin-z">z</a>, the jump around utility, to Fish.

	$ omf install z

### Terminator
> The goal of <a href="https://gnometerminator.blogspot.com/p/introduction.html">Terminator</a>  is to produce a useful tool for arranging terminals. It is inspired by programs such as gnome-multi-term, quadkonsole, etc. in that the main focus is arranging terminals in grids
como emulador de terminal e o  como shell.

    $ sudo dnf install terminator

### Tig

> <a href="https://github.com/jonas/tig">Tig</a> is an ncurses-based text-mode interface for git. It functions mainly as a Git repository browser, but can also assist in staging changes for commit at chunk level and act as a pager for output from various Git commands.

	$ sudo dnf install tig  


### Visual Studio Code

> <a href="https://code.visualstudio.com/docs/setup/setup-overview">Visual Studio Code</a> is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (such as C++, C#, Java, Python, PHP, Go) and runtimes (such as .NET and Unity).

	$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

	$ sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

	$ sudo dnf install code

### Remmina
	
><a href="https://github.com/FreeRDP/Remmina/wiki">Remmina</a> is a remote desktop client written in GTK+, aiming to be useful for
system administrators and travellers, who need to work with lots of remote
computers in front of either large monitors or tiny netbooks. Remmina supports
multiple network protocols in an integrated and consistent user interface.

	$ sudo dnf install remmina

### Postman

>The <a href="https://www.getpostman.com/docs/v6/">Postman</a> API has several endpoints to help you integrate Postman with your development toolchain. You can add new collections, update existing collections, update environments, or add and run monitors directly through the API. This API enables you to programmatically access your data stored in your Postman account with ease.

	$ cd /tmp 

	$ wget -q https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz

	$ tar -xzf postman.tar.gz

	$ rm postman.tar.gz

	$ sudo rm -rf /opt/Postman

	$ sudo mv Postman /opt/Postman

	$ sudo rm -f /usr/bin/postman

	$ sudo ln -s /opt/Postman/Postman /usr/bin/postman

	$ echo "[Desktop Entry]
	Name=Postman
	GenericName=API Client
	X-GNOME-FullName=Postman API Client
	Comment=Make and view REST API calls and responses
	Keywords=api;
	Exec=/opt/bin/postman
	Terminal=false
	Type=Application
	Icon=/opt/postman/resources/app/assets/icon.png
	Categories=Development;Utilities;" >> ~/.local/share/applications/postman.desktop


### NPM
> Use <a href="https://docs.npmjs.com/">npm</a> to adapt packages of code to your apps, or incorporate packages as they are, download standalone tools you can use right away, run packages without downloading using npx, and many more.

	$ sudo dnf install nodejs

# Setting dotfiles
clone dotfiles repo and update app's configurations

	$ git clone https://github.com/gnllucena/dotfiles

	$ cd dotfiles

	$ cp ./config.terminator ~/.config/terminator/config

	$ cp ./config.fish  ~/.config/fish/config.fish

	$ cp ./bash_profile  ~/.bash_profile

You need to restart /bin/bash after this in order for dotfiles changes takes place

# Creating development environments

### Docker

><a href="https://www.docker.com/what-container#/package_software">Docker</a> is a container platform. A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings.

	$ curl -fsSL get.docker.com -o get-docker.sh

	$ sh get-docker.sh

	$ sudo usermod -aG docker $USER

	$ sudo systemctl start docker

### .NET Core

><a href="https://docs.microsoft.com/pt-br/dotnet/core/">.NET Core</a> is a general purpose development platform maintained by Microsoft and the .NET community on GitHub. It is cross-platform, supporting Windows, macOS and Linux, and can be used in device, cloud, and embedded/IoT scenarios.

	$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

	$ wget -q https://packages.microsoft.com/config/fedora/27/prod.repo

	$ sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo

	$ sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo

	$ sudo dnf install dotnet-sdk-2.1

### Python

><a href="https://docs.python.org/3/faq/general.html#what-is-python">Python</a> is an interpreted, interactive, object-oriented programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface.

	$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

><a href="https://github.com/pyenv/pyenv">pyenv</a> lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

	$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv

><a href="https://github.com/pyenv/pyenv">pyenv-virtualenv</a> is a pyenv plugin that provides features to manage virtualenvs and conda environments for Python on UNIX-like systems.

	$ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


# Stuff

### Fedy
><a href="https://www.folkswithhats.org/">Fedy</a> lets you install multimedia codecs and additional software that Fedora doesn’t want to ship, such as MP3 support, Adobe Flash, Oracle Java, and much more, with just a few clicks.

	$ dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/fedy-release.rpm

	$ dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

	$ dnf install fedy

### Chrome
<a href="https://www.google.com/chrome/">Google's browser</a>
	
	$ sudo dnf install fedora-workstation-repositories

	$ sudo dnf config-manager --set-enabled google-chrome

	$ sudo dnf install google-chrome-stable


### Spotify
>There are millions of songs on <a href="https://www.spotify.com/us/">Spotify</a>. Play your favorites, discover new tracks, and build the perfect collection.

	$ sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo

	$ sudo dnf install spotify-client