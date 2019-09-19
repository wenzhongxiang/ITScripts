<#
Script Name: Set-ADUser_NewPassword.ps1
Created Time: 2019.09.19
Script Authors: wenzhongxiang
Version Control: 1.1
Script Usage: Powershell filters IP address information by MAC address, or reverses MAC address or host name information through IP.
Script Example:
Get-DhcpServerv4Lease ：从动态主机配置协议（DHCP）服务器服务获取一个或多个租约记录。
GET-DhcpServerv4Scope ：返回指定范围的IPv4范围配置。如果未指定ScopeId参数，则返回动态主机配置协议（DHCP）服务器服务上配置的所有范围。
#>

##########################
#1.通过IP过滤主机名、MAC地址
##########################
Get-DhcpServerv4Scope |Get-DhcpServerv4Lease |where {$_.IPAddress -like "10.10.10.10"}

##########################
#2.通过MAC过滤IP地址信息
##########################
Get-DhcpServerv4Scope |Get-DhcpServerv4Lease |where {$_.ClientId -like "a0-1d-48-b2-cc-66"}
