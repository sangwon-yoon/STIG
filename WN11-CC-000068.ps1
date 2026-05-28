<#
.SYNOPSIS
    This PowerShell script ensures that Windows 11 is configured to enable Remote host allows delegation of non-exportable credentials.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-28
    Last Modified   : 2026-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000068
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000068/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000068.ps1
#>

$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'

If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

Set-ItemProperty -Path $regPath -Name 'AllowProtectedCreds' -Value 1 -Type DWord

# Apply the changes
gpupdate /force
