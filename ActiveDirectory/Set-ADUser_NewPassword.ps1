<#
Script Name: Set-ADUser_NewPassword.ps1
Created Time: 2019.09.18
Script Authors: wenzhongxiang
Version Control: 1.1
Script Usage: Batch reset domain user password to random password.
Script Example:
 -ChangePasswordAtLogon
 指定在下次登录尝试期间是否必须更改密码。此参数的可能值包括：
 $false 或 0 
 $true 或 1
 对于同时将PasswordNeverExpires属性设置为true的帐户，此参数不能设置为$ true或1。
#>

##################################################
#1.导出当前OU下域用户信息
##################################################
Get-ADUser -Filter * -Properties * -SearchBase "OU=Staff,DC=azureyun,DC=com" |Select-Object Name,samaccountname |Export-Csv C:\wen\Staffusers.csv -Encoding UTF8 -NoTypeInformation
##################################################
#2.通过命令或Excel生成随机密码并完善CSV Password字段
#3.批量重置域账号密码为对应随机密码
##################################################
$userinfo = Import-Csv -Path "C:\wen\Set-ADUser_NewPassword_CSV.csv" -Encoding Default -UseCulture 
foreach ($user in $userinfo)
{
$sam=$user.samaccountname
$password=$user.password
#按CSV对应内容设置用户新密码
Set-ADAccountPassword -identity $sam -Reset -NewPassword (ConvertTo-SecureString -AsPlainText  "$password" -Force)
#设置域用户下次登陆必须修改密码
Set-ADUser -identity $sam -ChangePasswordAtLogon $true
}
