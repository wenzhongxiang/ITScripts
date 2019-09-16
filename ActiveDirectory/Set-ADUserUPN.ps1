<#
Script Name: Set-ADUserUPN.ps1
Created Time: 2019.09.16
Script Authors: wenzhongxiang
Version Control: 1.1
Script Usage: Batch replacement domain account UPN.
Script Example:
Get-ADUser -Filter * -Properties *  -SearchBase "OU=Users,DC=azureyun,DC=com" |Select-Object name,SamAccountName,UserPrincipalName
Set-ADUser -Identity $_.SamAccountName -UserPrincipalName ($_.SamAccountName+"@azureyun.com")}
#>

##################################################
#批量设置某OU路径下域用户UPN信息
##################################################
#导出当前OU下域账号UPN信息：
Get-ADUser -Filter * -Properties * -SearchBase "OU=Users,DC=azureyun,DC=com"  |Select-Object name,samaccountname,Displayname,UserPrincipalName |Export-Csv c:\Usersbak.csv -Encoding UTF8 -NoTypeInformation

#批量替换当前OU下域账号UPN为azureyun.com后缀：
Get-ADUser -Filter * -Properties *  -SearchBase "OU=Users,DC=azureyun,DC=com" |Select-Object name,SamAccountName,UserPrincipalName | foreach {Set-ADUser -Identity $_.SamAccountName -UserPrincipalName ($_.SamAccountName+"@azureyun.com")}

##################################################
#批量设置某CSV表中域用户UPN信息
##################################################
#导出CSV表中域账号UPN信息：
Import-Csv C:\user.csv |ForEach-Object {Get-ADUser -Identity $_.SamAccountName -Properties *  |select name,samaccountname,Displayname,UserPrincipalName } |Export-Csv c:\Usersbak.csv -Encoding UTF8 -NoTypeInformation

#批量替换CSV表中域账号UPN为azureyun.com后缀：
Import-Csv C:\user.csv |foreach {Set-ADUser -Identity $_.SamAccountName -UserPrincipalName ($_.SamAccountName+"@azureyun.com")}
