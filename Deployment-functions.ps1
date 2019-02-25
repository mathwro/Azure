#Functions used for deployments of various types.

function LoginCheck {
    $accinfo = az account show

    while (!$accinfo) {
        Write-Host "Please login to Azure"
        az login
    }       

    Write-Host "You are currently logged into:"
    Write-Host $accinfo`n

    $confirmation = Read-Host "Is this the correct account / subscription?"
    if ($confirmation -eq 'y' -or $confirmation -eq 'yes') {
        return $true
    }
    else {
        Write-Host "Please set correct subscription and rerun the script."
        exit
    }
}

function DeployVM {
    $vmuser = Read-Host "Enter username for VM:"
    $vmpass = Read-Host "Enter password for VM:" -AsSecureString
    Write-Host "Deploying VM"
    az vm create,
    --name $vmName,
    --group $ResourceGroupName,
    --location $Location,
    --image $image,
    --admin-username $vmuser,
    --admin-password $vmpass,
    --output none
}

function CreateRG {
    Write-Host "Creating resource group"
    az group create,
    --name $ResourceGroupName,
    --location $Location,
    --tags $Tagname=$tagvalue,
    --output none
}