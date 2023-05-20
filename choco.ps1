Import-Module ".\helpers.ps1"

if (-Not (ExistingProgram("choco")))
{
    Set-ExecutionPolicy Unrestricted
    [System.Net.ServicePointManageddr]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

ChocoFeature("enable", "-n allowGlobalConfirmation")
ChocoInstall("lsd git brave gsudo ripgrep oh-my-posh")


