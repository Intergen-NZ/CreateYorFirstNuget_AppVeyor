echo "Deploying Nuget"
$Status = 0;
Try{
    if($env:Is_Uploading_Nuget_To_Public_Serever.ToLower() -eq "true"){
        nuget push *.nupkg $env:ublic_Nuget_API_Key
    }
}
Catch{
    Write-Error -Message "Error: Could not Upload NugGet to public server"    
    $Status = 10;
}

Try{
    if($env:Is_Uploading_Nuget_To_Private_Server.ToLower() -eq "true"){
        nuget push *.nupkg -s $env:Private_Nuget_Server_URL $env:Private_Nuget_API_Key
    }
}
Catch{
    Write-Error -Message "Error: Could not Upload NugGet to private server" 
    $Status = $Status + 1
}

exit $Status