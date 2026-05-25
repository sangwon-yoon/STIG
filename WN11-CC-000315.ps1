<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Installer feature 'Always install with elevated privileges' is disabled.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-24
    Last Modified   : 2026-05-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000315.ps1 
#>

# Configure 'Always install with elevated privileges' to Disabled
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create the key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Setting the value to 0 = Disabled
Set-ItemProperty -Path $registryPath -Name "AlwaysInstallElevated" -Value 0 -Type DWord

Write-Host "Policy 'Always install with elevated privileges' has been set to Disabled." -ForegroundColor Green

# User Configuration counterpart
$registryPathUser = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"

if (-not (Test-Path $registryPathUser)) {
    New-Item -Path $registryPathUser -Force | Out-Null
}

Set-ItemProperty -Path $registryPathUser -Name "AlwaysInstallElevated" -Value 0 -Type DWord

Write-Host "User policy 'Always install with elevated privileges' has been set to Disabled." -ForegroundColor Green

# Apply the changes
gpupdate /force
