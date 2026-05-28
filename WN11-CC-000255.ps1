<#
.SYNOPSIS
    This PowerShell script ensures that the use of a hardware security device with Windows Hello for Business is enabled.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-28
    Last Modified   : 2026-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000255
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000255/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000255.ps1
#>

$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork'

If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

Set-ItemProperty -Path $regPath -Name 'RequireSecurityDevice' -Value 1 -Type DWord

# Apply the changes
gpupdate /force
