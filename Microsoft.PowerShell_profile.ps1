# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser
# Install-Module z -Scope CurrentUser
# Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force
# Install-Module PSReadLine -RequiredVersion 2.0.0-beta3 -AllowPrerelease
# Install-Module Get-ChildItemColor -Scope CurrentUser -AllowClobber
# Install-Module PSFzf -Scope CurrentUser
# scoop install fzf

Import-Module posh-git
Import-Module oh-my-posh
Import-Module z
Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module PSFzf -ArgumentList 'Ctrl+P','Ctrl+R'

set-psreadlineoption -predictionsource history
get-psreadlineoption | % predictionsource

Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Alias .. cd..
Set-Theme Paradox

cd c:/git