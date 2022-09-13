#Searches AD Users, retrives a list of locked out accounts and writes them to a .txt
Search-ADAccount -LockedOut -UsersOnly | 
Select-Object Name, GUID | 
Out-File -FilePath .\Locked_Out_Users.txt
Write-Host "Complete"