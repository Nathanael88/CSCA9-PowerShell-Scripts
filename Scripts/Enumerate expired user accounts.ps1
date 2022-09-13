$date = Get-date
Get-ADUser -f * -Properties AccountExpirationDate | select name,{$_.AccountExpirationDate -lt $date} |
Out-File -FilePath .\Expired_Users.txt
