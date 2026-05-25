<#
.SYNOPSIS
    This PowerShell script ensures that Group Policy objects are reprocessed even if they have not changed.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000090
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000090/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-CC-000090.ps1 
#>

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"

# Create the key if it doesn't exist
If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Enable 'Configure registry policy processing'
Set-ItemProperty -Path $regPath -Name "NoBackgroundPolicy" -Value 0 -Type DWord

# Enable 'Process even if the GPOs have not changed'
Set-ItemProperty -Path $regPath -Name "NoGPOListChanges" -Value 0 -Type DWord

Write-Host "Registry policy processing configured successfully." -ForegroundColor Green

# Apply the changes
gpupdate /force
