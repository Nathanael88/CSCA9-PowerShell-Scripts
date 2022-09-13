$date = Get-date
Get-ADUser -f * -Properties AccountExpirationDate | select name,{$_.AccountExpirationDate -eq $date} |
Out-File -FilePath .\Expired_Users_last24hrs.txt
