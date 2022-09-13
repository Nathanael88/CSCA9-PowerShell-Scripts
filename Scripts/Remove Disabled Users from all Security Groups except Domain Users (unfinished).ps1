$users = Get-ADUser -f * -Properties enabled
$SecurityGroups = Get-ADGroup -Filter {groupCategory -eq "security"} | where {$_.name -ne "Domain Guests" -or "Domain Users"}

foreach ($u in $users) {
    if ($u.enabled -eq $false) 
    {Remove-ADPrincipalGroupMembership -Identity $u -MemberOf $SecurityGroups}
}
Write-Host "#### Complete ####"
