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

if (LoginCheck ) {
    Write-Host "Beginning deployment...`n"

    #Creation of resources
    CreateRG
    #DeployVM
    
    Write-Host "Deployment complete"
}