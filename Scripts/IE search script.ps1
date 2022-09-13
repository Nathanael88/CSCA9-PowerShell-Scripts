#Replace "$Searchfor" [string] with list of what you want to search
$nav = 0x800
$getpro = Get-Process iexplore
$SearchFor = "Hawaiian Airlines","Southwest Airlines","Airbnb","Darktrace","Epic Systems","Autodesk","Microsoft","Amazon","Capgemini","Google"
$IE = New-Object -ComObject "InternetExplorer.Application"
foreach ($s in $SearchFor) {
$IE.Visible = $true
$IE.Navigate("https://www.google.com/search?q=$s+headquarters+location" , $nav)
Start-Sleep -Seconds 1
}
Write-Host "Complete"
