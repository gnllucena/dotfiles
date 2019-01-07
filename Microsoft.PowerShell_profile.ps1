# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser
# Install-Module z -Scope CurrentUser
# Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force
# Install-Module Get-ChildItemColor -Scope CurrentUser

Import-Module posh-git
Import-Module oh-my-posh
Import-Module z
Import-Module PSReadLine
Import-Module Get-ChildItemColor
# Import-Module PSFzf -ArgumentList 'Ctrl+P','Ctrl+R'

Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Theme Paradox