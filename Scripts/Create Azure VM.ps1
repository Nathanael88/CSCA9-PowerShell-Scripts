#Install the Azure Module
    <#If unable to install module run:

       [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
       Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    
    #>
    
Install-Module -Name Az -Scope CurrentUser

#Connect Azure account
Connect-AzAccount
    
#Create a Resource group (optional)
    
#Define admin credentals for VM
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."
    #Enter Desired logon credentals
#Paramiters for the VM that will be created
$vmParams = @{
    ResourceGroupName = 'myResourceGroup'
    Size = 'Standard_DS1_v2'
    Name = 'myVm3'
    Location = 'eastus'
    Image = 'Win2016Datacenter'
    PublicIpAddressName = 'TestPublicIp'
    Credential = $cred
    OpenPorts = 3389
}

#Create VM with previous paramiters
$VM3 = New-AzVM @vmParams

#Check conficuration and functionality of vm
$VM3
$VM3.OSProfile | Select-Object ComputerName,AdminUserName
$VM13 | Get-AzNetworkInterface | Select-Object -ExpandProperty IpConfigurations | Select-Object Name,PrivateIpAddress

#Check Public IP for RDP connection
$publicIp = Get-AzPublicIpAddress -Name TestPublicIp -ResourceGroupName myResourceGroup
$publicIp | Select-Object Name,IpAddress,@{label='FQDN';expression={$_.DnsSettings.Fqdn}}

#Connect to newly created VM
mstsc.exe /v <PUBLIC_IP_ADDRESS>



#USE AZURE BLUEPRINTS OR ARM TEMPLATES FOR OTHER CONFIGURATIONS
