#Restoring packages
nuget update -Self
nuget restore -source "$env:Private_Nuget_Server_Repo_URL;https://www.nuget.org/api/v2" -Verbosity detailed

#Updating AssemblyVersion.
$AssemblyInfoFile = Get-ChildItem $env:APPVEYOR_BUILD_FOLDER\*\*\AssemblyInfo.cs
(Get-Content $AssemblyInfoFile) | Foreach-Object {$_ -replace '(AssemblyVersion\(\"[0-9]+.[0-9]+.)[0-9]+.[0-9]+(\"\))', "`${1}$env:APPVEYOR_BUILD_NUMBER.0`${2}" } | Set-Content $AssemblyInfoFile




                                                                           