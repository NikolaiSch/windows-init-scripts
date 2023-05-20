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

    pwsh -windowstyle hidden -Command "choco feature $State $Package"
}

function ChocoInstall
{
    param (
        [string]$Package
    )

    pwsh -windowstyle hidden -Command "choco install $Package"
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

