<#
Script Name: Collect_Exchange_Configuration_Info.ps1
Created Time: 2019.09.16
Script Authors: wenzhongxiang
Version Control: 1.1
Script Usage: Collect Exchange configuration information.
Script Example:
Start-Transcript
#>

Start-Transcript C:\ExchangeEnvironmentBackup.txt
Get-ExchangeServer |fl *version*
Get-ExchangeServer -Status |fl name,Static*,current*
Get-Command ExSetup | ForEach {$_.FileVersionInfo}
Get-OrganizationConfig |fl *mapi*
Get-ExchangeCertificate |fl
Get-Exchangeserver | Get-ServerComponentState
Get-OutlookProvider |fl
Get-OutlookAnywhere |fl
Get-ClientAccessServer |fl
Get-ActiveSyncVirtualDirectory |fl
Get-AutodiscoverVirtualDirectory |fl
Get-EcpVirtualDirectory |fl
Get-OabVirtualDirectory |fl
Get-OwaVirtualDirectory |fl
Get-MapiVirtualDirectory |fl
Get-PowerShellVirtualDirectory |fl
Get-WebServicesVirtualDirectory |fl
Get-TransportConfig |ft maxsendsize,maxreceivesize
Get-ReceiveConnector |ft name,maxmessagesize
Get-SendConnector |ft name,maxmessagesize
Get-SendConnector | Where-Object {$_.Enabled -eq $true} |fl
Get-SendConnector | Where-Object {$_.Enabled -eq $true} | Get-ADPermission | Where-Object { $_.extendedrights -like '*routing*' } |fl identity,user,*rights
Get-Mailboxdatabase |fl name,*path*
Get-RemoteDomain
Get-TransportAgent "Malware Agent"
Get-ThrottlingPolicy |fl name,isdefault,EasMaxDevices
Get-ImapSettings |fl
Get-PopSettings  |fl
Get-IPAllowListConfig |fl
Get-IPBlockListConfig |fl
Get-DatabaseAvailabilityGroup |fl
Test-ServiceHealth |fl
Test-ReplicationHealth |fl
nslookup -type=a mail.azureyun.com
nslookup -type=a autodiscover.azureyun.com
nslookup -type=a mail.azureyun.com 8.8.8.8
nslookup -type=a autodiscover.azureyun.com 8.8.8.8
nslookup -type=mx  azureyun.com 8.8.8.8
nslookup -type=txt azureyun.com 8.8.8.8
Stop-Transcript
