#Deletes files that are older than 100 days
$date = Get-Date

#Replace XXX with file path###

Get-ChildItem -Path XXX -Recurse |

#Change (-100) to adjust number of days###

Where-Object {$_.lastWriteTime -lt $date.AddDays(-100)} |
  Remove-Item
  Write-Host "Complete"
