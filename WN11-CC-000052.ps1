<#
.SYNOPSIS
    This PowerShell script ensures that Windows 11 is configured to prioritize ECC Curves with longer key lengths first.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-28
    Last Modified   : 2026-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000052
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000052/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000052.ps1
#>

$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002'

If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

Set-ItemProperty -Path $regPath -Name 'EccCurves' -Value @('NistP384', 'NistP256') -Type MultiString

# Apply the changes
gpupdate /force
