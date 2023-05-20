function [bool]ExistingProgram
{
    param (
        $Name
    )
    
    $output = Get-Command $Name -ErrorAction SilentlyContinue
    
    if ($output)
    {
        return $true
    } else
    {
        return $false
    }
    
}

function ChocoFeature
{
    param (
        [string]$State,
        [string]$Option
    )

    Invoke-Expression -Command "choco feature $State $Option" -InformationAction SilentlyContinue -WarningAction SilentlyContinue
}

function ChocoInstall
{
    param (
        [string]$Package
    )

    Invoke-Expression -Command "choco install $Package" -OutVariable $out
    Write-Output "Successfully Installed $Package"
}

function [string]Profile
{
    return ((Split-Path $profile -Parent) + "\profile.ps1")
}

class Alias
{
    [string]$Name
    [string]$Command
    
    Alias(
        [string]$Name,
        [string]$Command
    )
    {
        $this.set($Name, $Command)
    }

    [void]set(
        [string]$Name,
        [string]$Command
    )
    {
        $this.Name = $Name
        $this.Command = $Command
    }

    [string]command()
    {
        return "Remove-Alias $($this.Name); New-Alias $($this.Name) $($this.Command)"
    }
}

