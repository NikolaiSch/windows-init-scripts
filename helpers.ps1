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
