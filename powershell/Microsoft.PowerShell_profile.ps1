
# Install nvm: https://github.com/coreybutler/nvm-windows/releases
# winget install Git.Git
# winget install Microsoft.PowerToys
# winget install Microsoft.VisualStudioCode
# winget install Microsoft.WindowsTerminal
# winget install Microsoft.PowerShell
# winget install JanDeDobbeleer.OhMyPosh -s winget
# oh-my-posh font install # FiraCode and FiraMono
# ssh-keygen
# nvm install 18
# nvm use 18
# iwr https://get.pnpm.io/install.ps1 -useb | iex
# New-Item -Path $PROFILE -Type File -Force 
# Install-Module z -Scope CurrentUser
# Install-Module PSReadLine -Scope CurrentUser 
# Install-Module Get-ChildItemColor -Scope CurrentUser

oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\robbyrussell.omp.json" | Invoke-Expression

Import-Module z
Import-Module PSReadLine
Import-Module Get-ChildItemColor

set-psreadlineoption -predictionsource history
get-psreadlineoption | % predictionsource

Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Alias .. cd..
Set-Alias cat Get-Content