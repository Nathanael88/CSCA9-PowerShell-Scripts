#Script that searches for users who havn't logged in in the past 30 days

$date = get-date
Get-ADUser -f * -Properties LastLogonDate |

#(-30) can be changed to adjust number of days

where {$_.LastlogonDate -le $date.AddDays(-30)} |

#Disable Account

Disable-ADAccount

#Writes results to a .txt

Get-ADUser -f * -Properties LastLogonDate |
where {$_.LastlogonDate -le $date.AddDays(-30)} |
select name, ObjectGUID, Lastlogondate, enabled |
Out-File -FilePath .\LastLogonDate_greater_than_30_days.txt
Write-Host "Complete"