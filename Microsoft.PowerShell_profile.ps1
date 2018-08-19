Import-Module posh-git
Import-Module oh-my-posh
Import-Module Jump.Location
Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module PSFzf -ArgumentList 'Ctrl+P','Ctrl+R'

Set-Alias ll Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Theme Agnoster
