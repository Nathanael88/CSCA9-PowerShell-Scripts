#import Active Diretory Module
Import-Module ActiveDirectory

#open File
#Windows forms
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

#Create and show file
#.csv file should be located in C:\
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.InitialDirectory = "C:\"
$dialog.Filter = "CSV (*.csv) | *.csv"
$dialog.ShowDialog() | Out-Null

#Store file path in variable
$CSVFile = $dialog.FileName

if([System.IO.File]::Exists($CSVFile)) {
    Write-Host "Import in Progress. . ."
    $CSV = Import-CSV -LiteralPath "$CSVFile"
} else {
    Write-Host ".csv file path not valid"
    Exit
    }

#Applies .csv properties to AD account
foreach ($u in $CSV) {

    <#Select specific properties to show (optional)

    $UserName = "$($u.'UserPrincipalName')"
    $UserName
    }    
    #>

    #Setup username variable
    $UserName = "$($u.'GivenName').$($u.'Surname')"
    $UserName = $UserName.Replace(" ", "")

    #Setup Password Variable
    #Password = Pa55w.rd
    $password = ConvertTo-SecureString "Pa55w.rd" -AsPlainText -Force

    #Create User
    New-ADUser  -Name "$($u.'GivenName') $($u.'Last Name')" `
                -GivenName $u.'GivenName' `
                -UserPrincipalName $u.'UserPrincipleName' `
                -SamAccountName $UserName `
                -EmailAddress $u.'UserPrincipleName' `
                -Surname $u.'Surname' `
                -AccountPassword $password `
                -Enabled $([System.Convert]::ToBoolean($u.Enabled))

    #User created message
    Write-Host "created $UserName"      
}