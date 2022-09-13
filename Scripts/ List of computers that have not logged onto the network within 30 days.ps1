#Script that generates .txt file of computers that have not logged on in the last 30 days
$date = get-date
Get-ADComputer -f * -Properties LastLogonDate |
where {$_.LastLogonDate -le $date.AddDays(-30)} |
Out-File .\Computer_LastLogonDate_greater_than_30_days.txt
Write-Host "#### Complete ####"