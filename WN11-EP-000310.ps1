<#
.SYNOPSIS
    This PowerShell script ensures that Windows 11 Kernel (Direct Memory Access) DMA Protection is enabled and set to block all.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-EP-000310/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000090.ps1 
#>

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"

# Create the key if it doesn't exist
If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set Enumeration Policy to 'Block All' (0)
Set-ItemProperty -Path $regPath -Name "DeviceEnumerationPolicy" -Value 0 -Type DWord

Write-Host "Kernel DMA Protection enumeration policy set to 'Block All'" -ForegroundColor Green

# Apply the changes
gpupdate /force
