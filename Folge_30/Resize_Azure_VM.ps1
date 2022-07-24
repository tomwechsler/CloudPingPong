Set-Location C:\
Clear-Host

#We need the module
Install-Module -Name Az -Force -AllowClobber -Verbose

#Log into Azure
Connect-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN Platforms" | Select-AzSubscription
Get-AzContext

#Manage Azure VMs

#Resize a VM
$resourceGroup = "tw-rg01"
$vmName = "srv2022"

#All the possible sizes for the vm 
Get-AzVMSize -ResourceGroupName $resourceGroup -VMName $vmName

#Collect all infos about the vm
$vm = Get-AzVM -ResourceGroupName $resourceGroup -VMName $vmName

#Get the current size
$vm.HardwareProfile.VmSize

#Set the new size
$vm.HardwareProfile.VmSize = "Standard_DS1"

#Update the size
Update-AzVM -VM $vm -ResourceGroupName $resourceGroup
