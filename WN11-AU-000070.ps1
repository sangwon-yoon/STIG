<#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to audit Logon/Logoff - Logon failures.

.NOTES
    Author          : Sangwon Yoon
    LinkedIn        : linkedin.com/in/sangwon-yoon/
    GitHub          : github.com/sangwon-yoon
    Date Created    : 2026-05-28
    Last Modified   : 2026-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000070
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000070/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN11-AU-000070.ps1 
#>

auditpol /set /subcategory:"Logon" /failure:enable
