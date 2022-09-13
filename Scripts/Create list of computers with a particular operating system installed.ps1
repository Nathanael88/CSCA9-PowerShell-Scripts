#Creates list of computers and thir operationg systems
Invoke-Command -ComputerName (Get-ADComputer –Filter * | Select –ExpandProperty Name) -ScriptBlock {
(Get-WMIObject win32_operatingsystem).name | 
select (Get-WMIObject win32_operatingsystem).name
} | 
Format-List |
Out-File -FilePath .\List_computer_operationg_systems.txt
Write-Host "#### Complete ####"