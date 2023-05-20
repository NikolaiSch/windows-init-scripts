Import-Module "./helpers.ps1"

[Alias[]]$aliases = @()

$aliases.Add([Alias]::New("cinst", "choco install"))
