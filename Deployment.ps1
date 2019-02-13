#Simple test script for deployment of server VM
#Based on the new AZ Powershell module.
Param(
    [string] $vmName = "myTestVM",
    [string] $Location = "West Europe",
    [string] $ResourceGroupName = 'TestRG',
    [string] $Tagname = 'Department',
    [string] $tagvalue = 'Test',
    [string] $image = 'UbuntuLTS',
    [parameter(ValueFromRemainingArguments=$true)] $additionalparameters

)

. $PSScriptRoot\Deployment-functions.ps1

#Test for existing login session
$accinfo = az account show

while (!$accinfo) {
    Write-Host "Please login to Azure"
    az login
}

Write-Host "You are currently logged into:"
Write-Host $accinfo`n

$confirmation = Read-Host "Is this the correct account / subscription?"
if ($confirmation -eq 'y' -or $confirmation -eq 'yes') {
    Write-Host "Beginning deployment...`n"

    CreateRG
    DeployVM
    
    Write-Host "Deployment complete"
}

else {
    Write-Host "Please set correct subscription and rerun the script."
    exit
}