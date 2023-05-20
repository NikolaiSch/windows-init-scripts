function ExistingProgram
{
    param (
        $Name
    )
    
    $output = Get-Command $Name -ErrorAction SilentlyContinue
    
    if ($output)
    {
        return True
    } else
    {
        return False
    }
    
}

function ChocoFeature
{
    param (
        $State,
        $Option
    )

    Invoke-Expression -Command "choco feature $State $Option"
}

function ChocoInstall
{
    param (
        $Package
    )

    Invoke-Expression -Command "choco install $Package"
}

function Profile
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

