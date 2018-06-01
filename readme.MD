Windows:
    Powershell:
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
        
        Rode o Ubuntu

        On ubuntu

        sudo apt-add-repository ppa:fish-shell/release-2
        sudo apt-get update
        sudo apt-get install fish

        change default shell 
            cp /windows/.bashrc $HOME/.bashrc