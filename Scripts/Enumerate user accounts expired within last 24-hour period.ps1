#Creates list of users who's accounts are expired 
$date = Get-date
Get-ADUser -f * -Properties AccountExpirationDate | select name,{$_.AccountExpirationDate -le $date} |
Out-File -FilePath .\Expired_Users_last24hrs.txt
