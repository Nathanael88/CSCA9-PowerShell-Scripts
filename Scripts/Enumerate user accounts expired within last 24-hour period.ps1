#Creates list of users who's accounts expired in the last 24 hours.
$date = Get-date
Get-ADUser -f * -Properties AccountExpirationDate | select name,{$_.AccountExpirationDate -le $date} |
Out-File -FilePath .\Expired_Users_last24hrs.txt
