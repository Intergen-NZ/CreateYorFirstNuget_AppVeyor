[string](Get-Content $env:APPVEYOR_BUILD_FOLDER\$env:AssemblyFilePath) -match 'AssemblyVersion\(\"([0-9]+.[0-9]+.)[0-9]+.[0-9]+\"\)'
$version = $matches[1]
$nuspecFile = (Get-ChildItem $env:APPVEYOR_BUILD_FOLDER\*.nuspec).Name
(Get-Content $nuspecFile) | Foreach-Object {$_ -replace "(<version>).*(<\/version>)", "`${1}$version$env:APPVEYOR_BUILD_NUMBER.0`${2}" } | Set-Content $nuspecFile
nuget pack $nuspecFile