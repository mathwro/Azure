#Simple test script for deployment of server VM
#Based on the new Azure CLI Powershell module.
Param(
    [string] $vmName = "myTestVM",
    [string] $Location = "West Europe",
    [string] $ResourceGroupName = 'TestRG',
    [string] $Tagname = 'Department',
    [string] $tagvalue = 'Test',
    [string] $image = 'UbuntuLTS',
    [parameter(ValueFromRemainingArguments=$true)] $additionalparameters

)

#Importing the functions
. $PSScriptRoot\Deployment-functions.ps1

#Check for currently logged in Azure account/subscription
LoginCheck

$confirmation = Read-Host "Is this the correct account / subscription?"
if ($confirmation -eq 'y' -or $confirmation -eq 'yes') {
    Write-Host "Beginning deployment...`n"

    #Creation of resources
    CreateRG
    #DeployVM
    
    Write-Host "Deployment complete"
}

else {
    Write-Host "Please set correct subscription and rerun the script."
    exit
}