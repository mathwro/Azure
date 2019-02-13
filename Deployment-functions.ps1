#Functions used for deployments of various types.

function LoginCheck {
    $accinfo = az account show

    while (!$accinfo) {
        Write-Host "Please login to Azure"
        az login
    }       

    Write-Host "You are currently logged into:"
    Write-Host $accinfo`n
}

function DeployVM {
    $vmuser = Read-Host "Enter username for VM:"
    $vmpass = Read-Host "Enter password for VM:" -AsSecureString
    Write-Host "Deploying VM"
    az vm create -n $vmName -g $ResourceGroupName -l $Location --image $image --admin-username $vmuser --admin-password $vmpass -o none
}

function CreateRG {
    Write-Host "Creating resource group"
    az group create -n $ResourceGroupName -l $Location --tags $Tagname=$tagvalue -o none
}