<#
.SYNOPSIS
    This PowerShell script ensures that The Remote Desktop Session Host requires secure RPC communications.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000285
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000285/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000285.ps1 
#>

$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'

If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

Set-ItemProperty -Path $regPath -Name 'fEncryptRPCTraffic' -Value 1 -Type DWord

# Apply the changes
gpupdate /force
