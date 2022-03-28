$Ubakdate = "{0:yyyyMMdd}" -f (Get-Date)
$Filename = $Ubakdate + "-Usersattbak.csv"
Get-ADUser -Filter * -Properties * -SearchBase "OU=Staff,DC=azureyun,DC=com" |Select-Object name,SamAccountName,Givenname,surname,Displayname,title,mobile,Created,Department,DistinguishedName,description,manager,
physicalDeliveryOfficeName,streetAddress,EmailAddress,homeMDB,mail,mailNickname,MemberOf,PrimaryGroup,proxyAddresses,UserPrincipalName,whenCreated,whenChanged,
employeeNumber,postalCode,company |Export-Csv D:\UserBak\$Filename  -Encoding UTF8 -NoTypeInformation