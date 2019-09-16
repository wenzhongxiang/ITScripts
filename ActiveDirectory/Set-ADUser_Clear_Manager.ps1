<#
Script Name: Set-ADUser_Clear_Manager.ps1
Created Time: 2019.09.16
Script Authors: wenzhongxiang
Version Control: 1.1
Script Usage: Batch clean up domain user manager information.
Script Example:
Set-ADUser  $_.samaccountname -Clear manager
#>

#导出当前OU下域账号Manager信息：
Get-ADUser -Filter * -Properties * -SearchBase "OU=Users,DC=azureyun,DC=com"  |Select-Object name,samaccountname,Displayname,UserPrincipalName,manager |Export-Csv c:\Usersmanager.csv -Encoding UTF8 -NoTypeInformation

#批量清理当前OU下用户Manager信息：
Get-ADUser -Filter * -SearchBase "OU=Users,DC=azureyun,DC=com" |foreach { Set-ADUser  $_.samaccountname -Clear manager }

