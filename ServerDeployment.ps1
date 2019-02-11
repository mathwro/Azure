#Simple test script for deployment of server VM
Param(
    [string] $vmName = "myTestVM",
    [string] $Location = "West Europe",
    [string] $ResourceGroupName = 'TestRG',
    [string] $Taggroup = 'Department',
    [string] $tagname = 'Test',
    [parameter(ValueFromRemainingArguments=$true)] $additionalparameters

)
#Test for existing login session
$accinfo = az account show

if ($accinfo) {
    Write-Host "You are currently logged into:"
    Write-Host $accinfo
}
else {
    Write-Host "Please login:"
    az login
}

New-AzResourceGroup -Name $ResourceGroupName -Location $Location -Tag @{$Taggroup=$tagname}
New-AzVM -Name $vmName -ResourceGroupName $ResourceGroupName -Location $Location -Credential (Get-Credential)

