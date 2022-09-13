#Script that moves disabled user accounts into Disabled_Users OU

### If Disabled_Users OU already Exisits skip to Step 2 ###

# STEP 1 (Create Disabled_Users OU)

New-ADOrganizationalUnit -Description "Disabled User Accounts" -Name Disabled_Users

# STEP 2 (Move Disabled Users into Disabled_Users OU)
### IMPORTANT #### 
#Change TargetPath DC to new Domain

$users = Get-ADUser -f * -Properties enabled
$date = get-date

foreach ($u in $users) {
    if ($u.enabled -eq $false) 
    {Move-ADObject -Identity $u -TargetPath "OU=Disabled_Users,DC=Adatum,DC=com"}
}
Write-Host "#### Complete ####"