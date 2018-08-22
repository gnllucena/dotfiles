# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser
# https://github.com/oraoto/Jump-Location/releases/tag/0.6.0-ps-core
# Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force

Import-Module posh-git
Import-Module oh-my-posh
Import-Module Jump.Location
Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module PSFzf -ArgumentList 'Ctrl+P','Ctrl+R'

Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Theme Paradox